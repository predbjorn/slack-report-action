STATUS=$(
  if [[ $ANDROID_STATUS == "success" && $IOS_STATUS == "success" ]]; then
    echo "success"
  elif [[ $ANDROID_STATUS == "fail" && $IOS_STATUS == "fail" ]]; then
    echo "fail"
  elif [[ $ANDROID_STATUS == "cancel" && $IOS_STATUS == "cancel" ]]; then
    echo "cancel"
  else
    echo "start"
  fi
)
STATUS_TEXT=$(
  case "$STATUS" in
    start) echo "in progress" ;;
    success) echo "succeeded" ;;
    fail) echo "failed" ;;
    cancel) echo "canceled" ;;
  esac
)
STATUS_COLOR=$(
  case "$STATUS" in
    start) echo "28a745" ;;
    success) echo "dbab09" ;;
    fail) echo "000000" ;;
    cancel) echo "A1A1A1" ;;
  esac
)
echo "STATUS=$STATUS" >> $GITHUB_OUTPUT
echo "STATUS_TEXT=$STATUS_TEXT" >> $GITHUB_OUTPUT
echo "STATUS_COLOR=$STATUS_COLOR" >> $GITHUB_OUTPUT
echo "Latest Version Name: $STATUS"
echo "Latest Version Code: $STATUS_TEXT"
echo "Latest Version Code: $STATUS_COLOR"