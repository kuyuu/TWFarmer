<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../resources/jcrop/css/jquery.Jcrop.css"
	type="text/css"></link>
<title>台灣小農</title>

<!-- Favicon 網頁上小icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="/TWFarmer/img/logo/TWFarmerLOGO-little.gif" />

<link href="/TWFarmer/css/bootstrap.css" rel="stylesheet">
<link href="/TWFarmer/css/style.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	background-color: #fcf5e0;
}

html {
	overflow-y: scroll;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/menu.jsp" />
		<div class="row">
			<div class="row jumbotron">

				<form name="form"
					action="<%=request.getContextPath()%>/UploadDemo/uploadHeadImage.do"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					
						<h2>上傳會員頭像<button id="submit" class="btn btn-primary btn-large" onclick="" style="margin-left:10px;">上傳</button></h2>
						
					<div class="modal-footer"></div>

					<div class="modal-body text-center">
						<div class="zxx_main_con">
							<div class="zxx_test_list">
								<input class="photo-file" type="file" name="imgFile"
									id="fcupload" onchange="readURL(this);" /> <img alt="" src=""
									id="cutimg" /> <input type="hidden" id="x" name="x" /> <input
									type="hidden" id="y" name="y" /> <input type="hidden" id="w"
									name="w" /> <input type="hidden" id="h" name="h" />
								<div class="jumbotron" style="margin: 5% auto;">


									<div id="preview-pane" class="location">
										<div class="preview-container">
											<img src="" class="jcrop-preview" alt="預覽">
										</div>
									</div>
								</div>

								<input type="hidden" value="${memberBean.memberId}"
									name="memberId" />
							</div>

						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script src="../js/scripts.js"></script>
	<script type="text/javascript"
		src="../resources/jcrop/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/jcrop/js/jquery.Jcrop.js"></script>
	<script type="text/javascript">
		var api = null,

		boundx, boundy,

		$preview = $('#preview-pane'), $pcnt = $('#preview-pane .preview-container'), $pimg = $('#preview-pane .preview-container img'),

		xsize = $pcnt.width(), ysize = $pcnt.height();

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.readAsDataURL(input.files[0]);
				reader.onload = function(e) {
					$('#cutimg').removeAttr('src');
					$('#cutimg').attr('src', e.target.result);
					$pimg.removeAttr('src');
					$pimg.attr('src', e.target.result);

					api = $.Jcrop('#cutimg', {
						setSelect : [ 20, 20, 200, 200 ],
						aspectRatio : 1,
						onSelect : updateCoords,
						onChange : updateCoords
					});
					var bounds = api.getBounds();
					boundx = bounds[0];
					boundy = bounds[1];
					$preview.appendTo(api.ui.holder);
				};
				if (api != undefined) {
					api.destroy();
				}
			}
			function updateCoords(obj) {
				$("#x").val(obj.x);
				$("#y").val(obj.y);
				$("#w").val(obj.w);
				$("#h").val(obj.h);
				if (parseInt(obj.w) > 0) {
					var rx = xsize / obj.w;
					var ry = ysize / obj.h;
					$pimg.css({
						width : Math.round(rx * boundx) + 'px',
						height : Math.round(ry * boundy) + 'px',
						marginLeft : '-' + Math.round(rx * obj.x) + 'px',
						marginTop : '-' + Math.round(ry * obj.y) + 'px'
					});
				}
			}
			;
		}
	</script>
</body>
</html>