echo "Latest Version Code: $ANDROID_STATUS"
echo "Latest Version Code: $IOS_STATUS"
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
echo "Latest Version Name: $STATUS"

STATUS_TEXT=$(
	if [[ "$STATUS" == "start" ]]; then
		echo "in progress"
	elif [[ "$STATUS" == "success" ]]; then
		echo "succeeded"
	elif [[ "$STATUS" == "fail" ]]; then
		echo "failed"
	elif [[ "$STATUS" == "cancel" ]]; then
		echo "canceled"
	else
		echo "is unknown"
	fi
)
STATUS_COLOR=$(
	if [[ "$STATUS" == "start" ]]; then
		echo "28a745"
	elif [[ "$STATUS" == "success" ]]; then
		echo "dbab09"
	elif [[ "$STATUS" == "fail" ]]; then
		echo "000000"
	elif [[ "$STATUS" == "cancel" ]]; then
		echo "A1A1A1"
	fi
)
echo "STATUS=$STATUS" >> $GITHUB_OUTPUT
echo "STATUS_TEXT=$STATUS_TEXT" >> $GITHUB_OUTPUT
echo "STATUS_COLOR=$STATUS_COLOR" >> $GITHUB_OUTPUT
echo "Latest Version Name: $STATUS"
echo "Latest Version Code: $STATUS_TEXT"
echo "Latest Version Code: $STATUS_COLOR"