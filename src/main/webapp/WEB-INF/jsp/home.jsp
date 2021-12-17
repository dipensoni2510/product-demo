<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
</head>
<body>
		<div class="container">
		  <h2>Product List</h2>
		  <table class="table table-striped">
		   <thead>
		    <th scope="row">Image</th>
		    <th scope="row">Product name</th>
		    <th scope="row">Details</th>
		    <th scope="row">Price</th>
		    <th scope="row">Quantity</th>
		    <th scope="row">Total price</th>
		    <th scope="row">Created date</th>
		    <th scope="row">Action</th>
		   </thead>
		   <tbody>
		   <c:forEach items="${products}" var="product">
		     <tr>
		      <td>${product.id }</td>
		      <td>${product.name }</td>
		      <td>${product.detail }</td>
		      <td>${product.price }</td>
		      <td>${product.quantity }</td>
		      <td>${product.totalprice }</td>
		      <td>${product.createdon }</td>
		      <td>
		       	<button class="update-product btn btn-primary btn-xs" data-id="${product.id }" role="button" >Update</button>
		      	<button class="delete-product btn btn-danger btn-xs" data-id="${product.id }" href="#" role="button" >Delete</button>
		      </td>
		     </tr>
		     </c:forEach>
		   </tbody>
		  </table>
		  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" onclick="openModal()" data-target="#myModal">Add New Product</button>
		 </div>
		 <!-- Modal -->
      	<div class="row d-flex justify-content-center pt-5">
      	<div id="createProduct" class="col-md-6" style="display: none">
      		<h5>Add/Update product</h5>
      		<hr/>
      		<form style="width:500px" action="#">
      			  <div class="form-group">  
				    <label for="exampleInputPassword1">Product id</label>  
				    <input type="text" class="form-control" id="id" name="id" placeholder="Product id">  
				  </div> 
				  <div class="form-group">  
				    <label for="exampleInputEmail1">Product Image</label>  
				    <input type="file" class="form-control" id="image" name="image">  
				  </div>  
				  <div class="form-group">  
				    <label for="exampleInputPassword1">Product Name</label>  
				    <input type="text" class="form-control" id="name" name="name" placeholder="Product Name">  
				  </div>  
				    <div class="form-group">  
				    <label for="exampleInputEmail1">Details</label>  
				    <input type="text" class="form-control" id="detail" name="detail" placeholder="Product detail">  
				  </div>  
				  <div class="form-group">  
				    <label for="exampleInputPassword1">Price</label>  
				    <input type="number" class="form-control" id="price" name="price" oninput="myFunction()" placeholder="Price">  
				  </div>
				  <div class="form-group">  
				    <label for="exampleInputEmail1">Quantity</label>  
				    <input type="number" class="form-control" id="quantity" name="quantity" oninput="myFunction()"  placeholder="Quantity">  
				  </div>  
				  <div class="form-group">  
				    <label for="exampleInputPassword1">Total price</label>  
				    <input type="text" class="form-control" id="totalprice" name="totalprice" placeholder="Total Price">  
				  </div>
				  <div class="form-group">  
				    <label for="exampleInputEmail1">Created date</label>  
				    <input type="date" class="form-control" id="createdon" name="createdon" placeholder="Email">  
				  </div>
				  <button type="submit" class="btn btn-default" id="saveproduct">Save</button>
				  <button type="submit" class="btn btn-default" id="updateproduct" style="display: none">Update</button> 
			</form>
			</div>
      	</div>
	</body>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script>
	function openModal() {
		document.getElementById("id").value = "";
		document.getElementById("image").value = "";
        document.getElementById("name").value = "";
        document.getElementById("detail").value = "";
        document.getElementById("quantity").value = "";
        document.getElementById("price").value = "";
        document.getElementById("totalprice").value = "";
	 	document.getElementById("createdon").value = "";
		$('#createProduct').show();
	}
	
	$('button.update-product').on('click', function(e){
		$('#saveproduct').hide();
		$('#updateproduct').show();
		
		var id = $(this).data('id');
		
		let formData = {
	 			id: id
	        }
		
		$.ajax({
            url: '/product/get',
            type: 'POST',
            contentType : "application/json",
            data: JSON.stringify(formData),
            dataType : 'json',
            async: false,
            cache: false,
            success: function (response) {
            	console.log(response);
            	$('#createProduct').show();
        		
        		document.getElementById("id").value = response.id;
        		document.getElementById("image").value = response.image;
                document.getElementById("name").value = response.name;
                document.getElementById("detail").value = response.detail;
                document.getElementById("quantity").value = response.quantity;
                document.getElementById("price").value = response.price;
                document.getElementById("totalprice").value = response.totalprice;
                var from = response.createdon.split("-")
                var f = new Date(from[2], from[1] - 1, from[0])
        	 	document.getElementById("createdon") = f;
            }
        });
	})
	
	$('button.delete-product').on('click', function(e){
		
		var id = $(this).data('id');
		
		let formData = {
	 			id: id
	        }
		
		e.preventDefault();
	    var id = $(this).data('id');
	    swal({
	            title: "Are you sure!",
	            type: "error",
	            confirmButtonClass: "btn-danger",
	            confirmButtonText: "Yes!",
	            showCancelButton: true,
	        },
	        function() {
	            $.ajax({
	            	url: '/product/delete',
	                type: 'POST',
	                contentType : "application/json",
	                data: JSON.stringify(formData),
	                dataType : 'json',
	                async: false,
	                cache: false,
	                success: function (response) {
	                	location.reload();
	                }         
	            });
	    });
	})
	
	$('button.delete-product1').on('click', function(e){
		
		var id = $(this).data('id');
		
		let formData = {
	 			id: id
	        }
		
		$.ajax({
            url: '/product/delete',
            type: 'POST',
            contentType : "application/json",
            data: JSON.stringify(formData),
            dataType : 'json',
            async: false,
            cache: false,
            success: function (response) {
            	console.log(response);
            	location.reload();
            }
        });
	})
	
	function myFunction() {
        var price = document.getElementById("price").value;
        var quantity = document.getElementById("quantity").value;
        var total = price * quantity;
        document.getElementById("totalprice").value = total;
    }
	
	$(document).delegate('#updateproduct', 'click', function(event) {
		event.preventDefault();
			
			var id = document.getElementById("id").value;
			var image = document.getElementById("image").value;
	        var name = document.getElementById("name").value;
	        var detail = document.getElementById("detail").value;
	        var quantity = document.getElementById("quantity").value;
	        var price = document.getElementById("price").value;
	        var totalprice = document.getElementById("totalprice").value;
		 	var createdon = document.getElementById("createdon").value;
		 	
		 	let formData = {
		 			id: id,
		 			image : image,
		 			name : name,
		            detail : detail,
		            quantity: quantity,
		            price: price,
		            totalprice : totalprice,
		            createdon : createdon
		        }
		 	
		 	 $.ajax({
		            url: '/product/update',
		            type: 'POST',
		            contentType : "application/json",
		            data: JSON.stringify(formData),
		            dataType : 'json',
		            async: false,
		            cache: false,
		            success: function (response) {
		            	location.reload();
		            }
		        });
			});
	
	$(document).delegate('#saveproduct', 'click', function(event) {
		event.preventDefault();
			
			var id = document.getElementById("id").value;
			var image = document.getElementById("image").value;
	        var name = document.getElementById("name").value;
	        var detail = document.getElementById("detail").value;
	        var quantity = document.getElementById("quantity").value;
	        var price = document.getElementById("price").value;
	        var totalprice = document.getElementById("totalprice").value;
		 	var createdon = document.getElementById("createdon").value;
		 	
		 	let formData = {
		 			id: id,
		 			image : image,
		 			name : name,
		            detail : detail,
		            quantity: quantity,
		            price: price,
		            totalprice : totalprice,
		            createdon : createdon
		        }
		 	
		 	 $.ajax({
		            url: '/product/save',
		            type: 'POST',
		            contentType : "application/json",
		            data: JSON.stringify(formData),
		            dataType : 'json',
		            async: false,
		            cache: false,
		            success: function (response) {
		            	location.reload();
		            }
		        });
			});
	
</script>
</html>