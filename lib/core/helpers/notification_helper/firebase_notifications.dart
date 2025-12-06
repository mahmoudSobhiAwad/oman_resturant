import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../enums/role_enum.dart';
import '../../storage/cache_helper.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/theme/app_colors.dart';

class FirebaseNotifications {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const String _channelId = 'huda_yousef_notifications';
  static const String _channelName = 'huda_yousef Notifications';
  static const String _channelDescription = 'huda_yousef app notifications';

  // Define notification icons with fallbacks
  static const String _primaryIcon = '@mipmap/launcher_icon';

  // Track initialization status
  static bool _isInitialized = false;
  static bool hasGranted = false;

  // Initialize Firebase and notifications
  static Future<void> initializeFirebase({required RoleEnum? role}) async {
    try {
      // Ensure Firebase is initialized
      if (role == null) await Firebase.initializeApp();

      // Initialize local notifications first
      if (role == null) await _initializeLocalNotifications();
      if (role != null) {
        await _requestNotificationPermission().then((granted) {
          hasGranted = granted;
        });
      }
      if (role != null) {
        hasGranted
            ? await FirebaseSubscribe.subscribeToTopics(role: role)
            : null;
      }

      // final FirebaseMessaging messaging = FirebaseMessaging.instance;

      // Set up message handlers
      if (role == null) _setupMessageHandlers();

      _isInitialized = true;
      if (kDebugMode) {
        log('Firebase notifications initialized successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error initializing Firebase: $e');
      }
    }
  }

  static Future<bool> _requestNotificationPermission() async {
    try {
      final FirebaseMessaging messaging = FirebaseMessaging.instance;
      final NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      final bool granted =
          settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;

      if (kDebugMode) {
        log('Notification permission status: ${settings.authorizationStatus}');
      }

      return granted;
    } catch (e) {
      if (kDebugMode) {
        log('Error requesting notification permission: $e');
      }
      return false;
    }
  }

  // Initialize local notifications with proper icon handling
  static Future<void> _initializeLocalNotifications() async {
    try {
      // Check if already initialized
      final bool? isInitialized = await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.areNotificationsEnabled();

      if (kDebugMode) {
        log('Android notifications enabled: $isInitialized');
      }

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings(_primaryIcon);

      const DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            requestCriticalPermission: false,
          );

      const InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
          );

      final bool? initialized = await _flutterLocalNotificationsPlugin
          .initialize(
            initializationSettings,
            onDidReceiveNotificationResponse: (NotificationResponse response) {
              // Handle notification tap
              if (response.payload != null) {
                if (kDebugMode) {
                  log('Notification payload: ${response.payload}');
                }
                // Add navigation logic here if needed
              }
            },
          );

      if (kDebugMode) {
        log('Local notifications initialization result: $initialized');
      }

      // Create notification channel for Android with proper icon
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.max,
        playSound: true,
        enableVibration: true,
        showBadge: true,
      );

      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();

      if (androidImplementation != null) {
        await androidImplementation.createNotificationChannel(channel);

        if (kDebugMode) {
          log('Android notification channel created successfully');
        }
      }

      if (kDebugMode) {
        log('Local notifications initialized successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error initializing local notifications: $e');
      }
    }
  }

  // Get the appropriate notification icon
  static String _getNotificationIcon() {
    return _primaryIcon;
  }

  // Show local notification with improved icon handling
  static Future<void> _showLocalNotification(RemoteMessage message) async {
    try {
      if (!_isInitialized) {
        if (kDebugMode) {
          log('Notifications not initialized, skipping local notification');
        }
        return;
      }

      final RemoteNotification? notification = message.notification;
      final Map<String, dynamic> data = message.data;

      if (kDebugMode) {
        log('Attempting to show local notification');
        log('Notification title: ${notification?.title}');
        log('Notification body: ${notification?.body}');
        log('Message data: $data');
      }

      if (notification != null) {
        // Get the appropriate icon
        final String iconToUse = _getNotificationIcon();

        final AndroidNotificationDetails androidDetails =
            AndroidNotificationDetails(
              _channelId,
              _channelName,
              channelDescription: _channelDescription,
              importance: Importance.max,
              priority: Priority.high,
              showWhen: true,
              icon: iconToUse,

              // Remove largeIcon if it's causing issues
              //  largeIcon: DrawableResourceAndroidBitmap(iconToUse),
              color: AppColors.primary,
              styleInformation: const DefaultStyleInformation(true, true),
              enableVibration: true,
              playSound: true,
              // Add these for better visibility
              autoCancel: true,
              ongoing: false,
              silent: false,
            );

        const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          badgeNumber: 1,
        );

        NotificationDetails notificationDetails = NotificationDetails(
          android: androidDetails,
          iOS: iOSDetails,
        );

        // Use a unique ID for each notification
        final int notificationId = DateTime.now().millisecondsSinceEpoch
            .remainder(100000);

        await _flutterLocalNotificationsPlugin.show(
          notificationId,
          notification.title ?? 'New Notification',
          notification.body ?? 'You have a new message',
          notificationDetails,
          payload: message.data.toString(),
        );

        if (kDebugMode) {
          log('Local notification shown successfully with ID: $notificationId');
        }
      } else {
        if (kDebugMode) {
          log('RemoteNotification is null, cannot show notification');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error showing local notification: $e');
      }

      // Fallback: try with simpler configuration
      try {
        await _showFallbackNotification(message);
      } catch (fallbackError) {
        if (kDebugMode) {
          log('Fallback notification also failed: $fallbackError');
        }
      }
    }
  }

  // Fallback notification with simpler configuration
  static Future<void> _showFallbackNotification(RemoteMessage message) async {
    try {
      final RemoteNotification? notification = message.notification;

      if (notification != null) {
        const AndroidNotificationDetails androidDetails =
            AndroidNotificationDetails(
              _channelId,
              _channelName,
              channelDescription: _channelDescription,
              importance: Importance.max,
              priority: Priority.high,
              showWhen: true,
              icon: _primaryIcon,
              playSound: true,
              enableVibration: true,
            );

        const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

        const NotificationDetails notificationDetails = NotificationDetails(
          android: androidDetails,
          iOS: iOSDetails,
        );

        final int notificationId = DateTime.now().millisecondsSinceEpoch
            .remainder(100000);

        await _flutterLocalNotificationsPlugin.show(
          notificationId,
          notification.title ?? 'New Notification',
          notification.body ?? 'You have a new message',
          notificationDetails,
          payload: message.data.toString(),
        );

        if (kDebugMode) {
          log('Fallback notification shown successfully');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        log('Fallback notification failed: $e');
      }
    }
  }

  static bool _messageHandlersSet = false;

  static void _setupMessageHandlers() {
    if (_messageHandlersSet) return;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        log('Foreground message received: ${message.notification?.title}');
        log('Message data: ${message.data}');
      }
      _showLocalNotification(message);
    });
    _messageHandlersSet = true;
    // Background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // When app is opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        log('App opened from notification: ${message.notification?.title}');
      }
      _handleNotificationTap(message);
    });

    // App opened from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? message,
    ) {
      if (message != null) {
        if (kDebugMode) {
          log(
            'App opened from terminated state: ${message.notification?.title}',
          );
        }
        _handleNotificationTap(message);
      }
    });

    if (kDebugMode) {
      log('Message handlers set up successfully');
    }
  }

  // Handle notification tap actions
  static void _handleNotificationTap(RemoteMessage message) {
    if (kDebugMode) {
      log('Handling notification tap: ${message.data}');
    }

    // Example navigation logic:
    // final String? screen = message.data['screen'];
    // final String? id = message.data['id'];
    //
    // switch (screen) {
    //   case 'order':
    //     // Navigate to order details
    //     break;
    //   case 'chat':
    //     // Navigate to chat
    //     break;
    //   default:
    //     // Navigate to home
    //     break;
    // }
  }

  // Test method to verify local notifications work
  static Future<void> testLocalNotification() async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            importance: Importance.max,
            priority: Priority.high,
            icon: _primaryIcon,
          );

      const NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      await _flutterLocalNotificationsPlugin.show(
        999,
        'Test Notification',
        'This is a test notification to verify local notifications work',
        notificationDetails,
      );

      if (kDebugMode) {
        log('Test notification sent');
      }
    } catch (e) {
      if (kDebugMode) {
        log('Test notification failed: $e');
      }
    }
  }
}

// Background message handler with improved error handling
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
    if (kDebugMode) {
      log('Background message received: ${message.notification?.title}');
      log('Background message data: ${message.data}');
    }

    // Update notification badge service

    // Note: Background notifications are handled automatically by the system
    // You typically don't need to show local notifications here unless you have specific requirements
  } catch (e) {
    if (kDebugMode) {
      log('Error in background message handler: $e');
    }
  }
}

class FirebaseSubscribe {
  static Future<void> subscribeToTopics({required RoleEnum role}) async {
    try {
      final FirebaseMessaging messaging = FirebaseMessaging.instance;
      final String? userId = AppSharedPreferences.sharedPreferences.getString(
        AppConstants.userId,
      );
      switch (role) {
        case RoleEnum.user:
          if (userId != null) {
            await messaging.subscribeToTopic('user-$userId');
            if (kDebugMode) {
              log('Subscribed to user topics: user-$userId');
            }
          }
          break;
        case RoleEnum.influencers:
          if (userId != null) {
            await messaging.subscribeToTopic('store-$userId');
            if (kDebugMode) {
              log('Subscribed to store topics: store-$userId');
            }
          }
          break;
        case RoleEnum.employees:
          if (userId != null) {
            await messaging.subscribeToTopic('store-$userId');
            if (kDebugMode) {
              log('Subscribed to store topics: store-$userId');
            }
          }
          break;
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error subscribing to topics: $e');
      }
    }
  }
}

class FirebaseUnsubscribe {
  static Future<void> unsubscribeFromTopics(RoleEnum role) async {
    try {
      final FirebaseMessaging messaging = FirebaseMessaging.instance;
      final String? userId = AppSharedPreferences.sharedPreferences.getString(
        AppConstants.userId,
      );

      if (userId != null) {
        switch (role) {
          case RoleEnum.user:
            await messaging.unsubscribeFromTopic('user-$userId');
            log('Unsubscribed from user topics for userId: $userId');

            break;
          case RoleEnum.influencers:
            await messaging.unsubscribeFromTopic('store-$userId');
            log('Unsubscribed from user topics for influencer: $userId');
            break;
          case RoleEnum.employees:
            await messaging.unsubscribeFromTopic('store-$userId');
            log('Unsubscribed from user topics for employee: $userId');
            break;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        log('Error unsubscribing from topics: $e');
      }
    }
  }
}
