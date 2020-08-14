class AppImages {
  static final _root = "assets/images/";

  static join(endpoint) {
    return _root + endpoint;
  }

  static final pin = _root + "pin.png";
  static final call = _root + "ic_call.png";
  static final chat = join("ic_chat.png");
  static final video = join("ic_video.png");
  static final star = join("ic_star.png");
  static final arrowDownOutlined = join("ic_arrow_down_outlined.png");
  static final filter = join("ic_filter.png");
}