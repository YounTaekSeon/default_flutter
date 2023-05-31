class SystemEvent {
  static final SystemEvent REQUEST_START = SystemEvent(399);
  static final SystemEvent TOKEN_EXPIRED = SystemEvent(410);
  static final SystemEvent FAILED_REQUEST = SystemEvent(412);
  static final SystemEvent WRONG_RESPONSE = SystemEvent(413);
  static final SystemEvent CLIENT_ERROR = SystemEvent(414);
  static final SystemEvent SUCCESSFUL = SystemEvent(200);
  static final SystemEvent UNDEFINED = SystemEvent(499);

  int code;
  dynamic error;
  StackTrace? stack;

  SystemEvent(this.code);

  @override
  bool operator ==(other) {
    if (other is! SystemEvent) {
      return false;
    }

    return code == other.code;
  }

  setErrorInfo({dynamic error, StackTrace? stackTrace}) {
    this.error = error;
    stack = stackTrace;
  }
}