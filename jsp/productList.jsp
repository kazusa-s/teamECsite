<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/productList_style.css">

<title>商品一覧</title>


</head>



<body>
<jsp:include page="header.jsp" />


<div id="contents">
<div id="ordinal">
<div id="box-wide">

<s:if test="!(productInfoDtoList==null)">
<h1>商品一覧画面</h1>
</s:if>

<s:if test="productInfoDtoList==null">
<s:if test="!#session.keywordsErrorMessageList.isEmpty()">
<s:iterator value="#session.keywordsErrorMessageList"><s:property /><br></s:iterator>
</s:if>
<s:if test="#session.keywordsErrorMessageList.isEmpty()">
<div id="info">検索結果がありません</div>
</s:if>
</s:if>

<s:else>

<!-- 商品一覧表示画面 -->

<div id="product-list">
<s:iterator value="#session.productInfoDtoList">
<div class="product-list-box">
<ul>
    <li>
    <a href='<s:url action="ProductDetailsAction">
    <s:param name="productId" value="%{productId}"/>
    </s:url>'><img src='<s:property value="%{imageFilePath}"/>/<s:property value="%{imageFileName}"/>' class="item-image-box-200"/></a><br>
    <div class ="inline"><s:property value="productName"/></div><br>
    <div class ="inline"><s:property value="productNameKana"/></div><br>
    <s:property value="price"/>円<br>
    </li>
</ul>
</div>
</s:iterator>


<div id="clear"></div>

</div>

<!-- 商品一覧表示画面 おわり -->


<!-- ページング部分 -->

<div class="pager">
<s:iterator begin="1" end="#session.totalPageSize" status="pageNo">
   <s:if test="#session.currentPageNo == #pageNo.count">
       <s:property value="%{#pageNo.count}"/>
   </s:if>
   <s:else>
        <a href="<s:url action='SearchProductAction'><s:param name='pageFlg' value='1'/><s:param name='pageNo' value='%{#pageNo.count}'/><s:param name='categoryId' value='%{categoryId}'/><s:param name='keywords' value='%{keywords}'/></s:url>"> <s:property value="%{#pageNo.count}"/></a>
   </s:else>
</s:iterator>
</div>

<!-- ページング部分 おわり -->

</s:else>


</div>
</div>
</div>
<s:include value="footer.jsp" />

</body>



</html>