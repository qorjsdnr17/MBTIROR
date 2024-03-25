<%@ page contentType="text/html; charset=UTF-8"%>

<%
String listCtrl = "./listController.jsp";
%>

<section>
	<div class="main" id="main">

		<div class="box" id="box01">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="istj">
				<button type="submit">
					<img src="./images/mbtiIcon/istj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box02">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="isfj">
				<button type="submit">
					<img src="./images/mbtiIcon/isfj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box03">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="infj">
				<button type="submit">
					<img src="./images/mbtiIcon/infj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box04">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="intj">
				<button type="submit">
					<img src="./images/mbtiIcon/intj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box05">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="istp">
				<button type="submit">
					<img src="./images/mbtiIcon/istp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box06">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="isfp">
				<button type="submit">
					<img src="./images/mbtiIcon/isfp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box07">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="infp">
				<button type="submit">
					<img src="./images/mbtiIcon/infp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box08">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="intp">
				<button type="submit">
					<img src="./images/mbtiIcon/intp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box09">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="estp">
				<button type="submit">
					<img src="./images/mbtiIcon/estp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box10">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="esfp">
				<button type="submit">
					<img src="./images/mbtiIcon/esfp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box11">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="enfp">
				<button type="submit">
					<img src="./images/mbtiIcon/enfp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box12">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="entp">
				<button type="submit">
					<img src="./images/mbtiIcon/entp.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box13">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="estj">
				<button type="submit">
					<img src="./images/mbtiIcon/estj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box14">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="esfj">
				<button type="submit">
					<img src="./images/mbtiIcon/esfj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box15">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="enfj">
				<button type="submit">
					<img src="./images/mbtiIcon/enfj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

		<div class="box" id="box16">
			<form action="<%=listCtrl%>" method="POST">
				<input type="hidden" name="mbti" value="entj">
				<button type="submit">
					<img src="./images/mbtiIcon/entj.png" width="150px;" height="90px" />
				</button>
			</form>
		</div>

	</div>
</section>