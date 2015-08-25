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
    <title>Angular.Js Filters</title>

    <link rel="stylesheet" href="resources/bootstrap.min.css"/>
    <link rel="stylesheet" href="resources/style.css"/>

    <script type="text/javascript" src="resources/angular.min.js"></script>
    <script type="text/javascript" src="resources/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="resources/store.js"></script>
    <script type="text/javascript" src="products.json"></script>
  </head>
  <body ng-controller="StoreController as store">
    <div class="row">
      <ul class="list-group">
        <li class="list-group-item  col-xs-3" ng-repeat="product in store.products">
          <h3>{{product.name}}</h3>
          <h3 class="pull-right">{{product.price | currency}}</h3>
          <img ng-src="{{product.images[0].thumb}}" />
          <section ng-controller="PanelController as panel">
            <ul class="nav nav-pills">
              <li ng-class="{active: panel.isSelected(1)}">
                <a href="" ng-click="panel.selectTab(1)">Description</a>
              </li>
              <li ng-class="{active: panel.isSelected(2)}">
                <a href="" ng-click="panel.selectTab(2)">Specifications</a>
              </li>
              <li ng-class="{active: panel.isSelected(3)}">
                <a href="" ng-click="panel.selectTab(3)">Reviews</a>
              </li>
            </ul>

            <div class="panel" ng-show="panel.isSelected(1)">
              <h4>Description</h4>
              <p>{{product.description}}</p>
            </div>

            <div class="panel" ng-show="panel.isSelected(2)">
              <h4>Specifications</h4>
              <p>{{product.specification}}</p>
            </div>

            <div class="panel" ng-show="panel.isSelected(3)">
              <h4>Reviews</h4>
              <div ng-repeat="review in product.review">
                <b>Stars: {{review.stars}}</b><br/>
                {{review.body}}<br/>
                <cite>by: {{review.author}}</cite>
              </div>
              <p ng-hide="product.review.length">None yet!</p>

              <form class="form-horizontal" name="reviewForm" ng-controller="ReviewController as reviewCtrl" ng-submit="reviewForm.$valid && reviewCtrl.addReview(product)" novalidate>
                <blockquote ng-show="reviewCtrl.review.stars">
                  <b>Stars: {{reviewCtrl.review.stars}}</b><br/>
                  {{reviewCtrl.review.body}}<br/>
                  <cite>by: {{reviewCtrl.review.author}}</cite>
                </blockquote>

                <select ng-model="reviewCtrl.review.stars" class="ng-pristine ng-invalid" required>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
                <br/>

                <label>Review:</label>
                <textarea type="text" ng-model="reviewCtrl.review.body" class="ng-pristine ng-invalid" required></textarea><br/>
                <label>By:</label>
                <input type="email" placeholder="ex: john@john.com" ng-model="reviewCtrl.review.author"  class="ng-pristine ng-invalid" required /><br/>
                <input type="submit" />

              </form>
            </div>

          </section>
        </li>
      </ul>
    </div>
  </body>

</html>
