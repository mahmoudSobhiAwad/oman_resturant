double getMaxCrossAxisExtent(double width) {
  if (width > 350 && width < 550) {
    return width / 2; // Force 2 columns
  } else if (width >= 550 && width < 800) {
    return width / 3; // Force 3 columns
  } else if (width >= 800 && width < 1000) {
    return width / 4; // Force 4 columns
  } else if (width >= 1000 && width < 1200) {
    return width / 5; // Force 5 columns
  } else if (width >= 1200) {
    return width / 6; // Force 6 columns
  }
  return 200; // Default value
}
