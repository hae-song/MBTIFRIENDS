<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>API 연습</title>
<!-- 	1b5405e20464aac0e19f610b91f76602 -->
</head>
<body>
	<h1>내 사이트</h1>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	 <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('1b5405e20464aac0e19f610b91f76602');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
	<script>
	$.ajax({
		  method: "GET",
		  url: "https://developers.kakao.com/sdk/js/kakao.js",
		  data: { profile: "", profile_nickname: "", name: "" }
		})
		  .done(function( msg ) {
		    console.log(msg);
		  });
	</script>
</body>
</html>
