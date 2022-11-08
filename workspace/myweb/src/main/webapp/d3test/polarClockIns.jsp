<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Polar Clock</title>
	<link rel="stylesheet" type="text/css" href="../css/polarClockIns.css">
</head>
<body>
	<script type="module">

	import define from "../js/polarClockIndex.js";
	import {Runtime, Inspector} from "https://cdn.jsdelivr.net/npm/@observablehq/runtime@4/dist/runtime.js";

	const runtime = new Runtime();
	const main = runtime.module(define, Inspector.into(document.body.childNodes[12]));

	</script>

</body>
</html>