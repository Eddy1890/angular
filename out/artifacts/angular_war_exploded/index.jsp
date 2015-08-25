<%--
  Created by IntelliJ IDEA.
  User: MihocE
  Date: 8/19/2015
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="store">
  <head>
    <title>Angular.Js</title>
    <link rel="stylesheet" href="resources/bootstrap.min.css"/>
    <script type="text/javascript" src="resources/angular.min.js"></script>
    <script type="text/javascript" src="resources/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="resources/store.js"></script>
  </head>
  <body>
    <%--Angular js app structure--%>
    <%--Define directive(module controller - this case StoreController)--%>
    <div ng-controller="StoreController as store"><%--***StoreController scope--%>
      <div ng-repeat="product in store.products">
        <div ng-hide="product.soldOut">
          <%--Use inheritance to access StoreController instance store members (store.product.attribute of Controller member)--%>
          <h1> {{product.name}} </h1>
          <h2> $ {{product.price}} </h2>
          <p> {{product.description}} </p>
          <button ng-show="product.canPurchase"> Add to cart</button><%--angular directive to hide/show element depending on expression evaluation--%>
        </div>
      </div>
    </div><%--***/StoreController scope--%>

    <%--/Angular js--%>
  </body>

</html>
