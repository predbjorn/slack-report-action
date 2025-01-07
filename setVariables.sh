STATUS=$(
  if [[ $ANDROID_STATUS == "success" && $IOS_STATUS == "success" ]]; then
    echo "success"
  elif [[ $ANDROID_STATUS == "failure" && $IOS_STATUS == "failure" ]]; then
    echo "failure"
  elif [[ $ANDROID_STATUS == "skipped" && $IOS_STATUS == "skipped" ]]; then
    echo "skipped"
  else
    echo "start"
  fi
)

ANDROID_STATUS_ICON=$(
	if [[ "$ANDROID_STATUS" == "start" ]]; then
		echo ":rocket:"
	elif [[ "$ANDROID_STATUS" == "success" ]]; then
		echo ":white_check_mark:"
	elif [[ "$ANDROID_STATUS" == "failure" ]]; then
		echo ":octagonal_sign:"
	elif [[ "$ANDROID_STATUS" == "skipped" ]]; then
		echo ":heavy_multiplication_x:"
	else
		echo ":boom:"
	fi
)
IOS_STATUS_ICON=$(
	if [[ "$IOS_STATUS" == "start" ]]; then
		echo ":rocket:"
	elif [[ "$IOS_STATUS" == "success" ]]; then
		echo ":white_check_mark:"
	elif [[ "$IOS_STATUS" == "failure" ]]; then
		echo ":octagonal_sign:"
	elif [[ "$IOS_STATUS" == "skipped" ]]; then
		echo ":heavy_multiplication_x:"
	else
		echo ":boom:"
	fi
)
STATUS_TEXT=$(
	if [[ "$STATUS" == "start" ]]; then
		echo "in progress"
	elif [[ "$STATUS" == "success" ]]; then
		echo "succeeded"
	elif [[ "$STATUS" == "failure" ]]; then
		echo "failed"
	elif [[ "$STATUS" == "skipped" ]]; then
		echo "canceled"
	else
		echo "is unknown"
	fi
)
STATUS_COLOR=$(
	if [[ "$STATUS" == "start" ]]; then
		echo "dbab09"
	elif [[ "$STATUS" == "success" ]]; then
		echo "28a745"
	elif [[ "$STATUS" == "failure" ]]; then
		echo "000000"
	elif [[ "$STATUS" == "skipped" ]]; then
		echo "A1A1A1"
	fi
)
ANDROID_BUILD_TIME=$(
	if [[ "$ANDROID_STATUS" == "start" ]]; then
		if [[ $ANDROID_ETA == "" ]]; then
			echo "Building ..."
		else
			echo "ETA: $ANDROID_ETA"
		fi
	else
		if [[ $ANDROID_BUILD_TIME == "" ]]; then
			if [[ "$STATUS" == "success" ]]; then
				echo ":heavy_check_mark:"
			else 
				echo ":heavy_multiplication_x:"
			fi
			echo 
		else
			echo "Time used: $ANDROID_BUILD_TIME"
		fi
	fi
)
IOS_BUILD_TIME=$(
	if [[ "$IOS_STATUS" == "start" ]]; then
		if [[ $IOS_ETA == "" ]]; then
			echo "Building ..."
		else
			echo "Eta: $IOS_ETA"
		fi
	else
		if [[ $IOS_BUILD_TIME == "" ]]; then
			if [[ "$STATUS" == "success" ]]; then
				echo ":heavy_check_mark:"
			else 
				echo ":heavy_multiplication_x:"
			fi
		else
			echo "Time used: $IOS_BUILD_TIME"
		fi
	fi
)
echo "STATUS=$STATUS" >> $GITHUB_OUTPUT
echo "STATUS_TEXT=$STATUS_TEXT" >> $GITHUB_OUTPUT
echo "STATUS_COLOR=$STATUS_COLOR" >> $GITHUB_OUTPUT
echo "IOS_STATUS_ICON=$IOS_STATUS_ICON" >> $GITHUB_OUTPUT
echo "ANDROID_STATUS_ICON=$ANDROID_STATUS_ICON" >> $GITHUB_OUTPUT
echo "ANDROID_BUILD_TIME=$ANDROID_BUILD_TIME" >> $GITHUB_OUTPUT
echo "IOS_BUILD_TIME=$IOS_BUILD_TIME" >> $GITHUB_OUTPUT
echo "STATUS: $STATUS"
echo "STATUS_TEXT: $STATUS_TEXT"
echo "Latest Version Code: $STATUS_COLOR"
echo "IOS_STATUS_ICON: $IOS_STATUS_ICON"
echo "ANDROID_STATUS_ICON: $ANDROID_STATUS_ICON"
echo "ANDROID_BUILD_TIME: $ANDROID_BUILD_TIME"
echo "IOS_BUILD_TIME: $IOS_BUILD_TIME"
echo "VERSION_NR: $VERSION_NR"
echo "ANDROID_ETA: $ANDROID_ETA"
echo "IOS_ETA: $IOS_ETA"
echo "JIRA_URL: $JIRA_URL"
echo "Variables set successfully"