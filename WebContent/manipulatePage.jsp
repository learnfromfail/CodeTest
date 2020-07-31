<%@ page import="entity.product" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.receipt" %>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Users</title>
</head>
<body>
	<%	
		product newProduct = (product)request.getAttribute("student") ;
	%>
	<h2>ShoppingCart </h2>
	<span>Current time: </span><span id='now'></span>
	<table>
	<tr>
	<td style="width:50%">
		<h3>Internal Users Entering Products</h3>
		<form action="addProduct" id='internalForm' method="post">
			<table>
			<tr><td><label>Product Name</label></td>
			<td><input name='productName' id='nameID'></td></tr>
			<tr><td><label>Category</label></td>
			<td>
			<select name='select' id='selectID'>
					<option value='notYet'>Please select</option>
					<option value='food'>Food</option>
					<option value='clothing'>clothing</option>
					<option value='beverage'>Beverage</option>
					<option value='utensil'>Utensil</option>
					<option value='drug'>Drug</option>
				</select>
				</td>
			</tr>
			<tr><td><label>Price</label></td>
			<td><input name='price' id='priceID'></td></tr>
			<tr><td></td>
			<td><button type='button' onClick='validateData();'>Add this Product</button></td></tr>
			</table>		
		</form>
	</td>
	<td style="width:50%">
		<h3>External Users(Customers) Choosing Products</h3>
		<form action="servlet/selectProduct" id='externalForm' method="post">
			<table>
				<tr>
					<td><label>Product</label></td>
					<td>
					<select id="selectBuyID" onChange="reCalculate()" >
							<option value='notYet'>Please select</option>
						<%	//data from request
							int a = 0;
							List<product> productList = (List<product>) request.getAttribute("productList");
							for(product thisProduct : productList){
						%>
							<option class="<%=thisProduct.category%>" value=<%=thisProduct.price%> id=<%=a++%>><%=thisProduct.name%>&nbsp;(<%= thisProduct.category %>)</option>	
						<%
							}
						%>
					</select>
					</td>
				</tr>
				<tr>
					<td><Label>Quantity</Label></td>
					<td><input id='quantity' value="1" onChange="reCalculate()" oninput="reCalculate()"></td>
				</tr>
				<tr>
				<td><span>Each Cost:</span></td>
				 <td><span id='oneC'></span></td>
				</tr>
				<tr>
				<td><span>All Cost:</span></td>
				<td><span id='allC'></span></td>
				</tr>
							
				<tr>
				<td></td><td><button type='button' onClick='validateBuying();'>Select this product</button></td>
				</tr>
			</table>		
		</form>
	</td>
	</tr>
	</table>
	<hr>

	<table>
		<h3>Shopping Cart:</h3>
		<ul id="ShoppingItemsUL">
			<li id="ShoppingItems"></li>
		</ul>
		<span>Subtotal Cost: </span><span id="subtotalCost">0</span><br>
		<span>			Tax: </span><span id="taxCost">0</span><br>
		<span>	 Total Cost: </span><span id="totalCost">0</span>
		<hr>
		<script>
		function roundUp0p05(){
				$("#taxUsed").text(  (Math.ceil(Number( $('#areaSelect').val() ) * 20) / 20  ).toFixed(2));
		}
		</script>
		<span id="SumCostNoTax"></span>
		<select id="areaSelect" onChange='roundUp0p05()'>
			<option value="NotYet" >Please Select</option>
			<option value="9.75" id="Ca">California (CA 9.75)</option>
			<option value="8.875" id="NY">New York (NY 8.875)</option>
			<option value="1.13" id="MK">Mong Kok(1.13)</option>
			<option value="1.16" id="YMT">Yau Ma Tei(1.16)</option>
			<option value="1.151" id="TST">Tsim Sha Tsui(1.151)</option>
		</select>
		<span >Tax(Corrected to the nearest 0.05 ) : </span><span id="taxUsed"></span>
		<br>
		<button onClick="AfterTaxSumCost()"> Calculate Sum Cost</button>
		<span><br>In California (CA), sales tax rate food is exempt, 
		<br>and In New York (NY), sales tax rate is 8.875%, food and clothing are exempt. Other options' sales tax includes all category</span>
		<br>
		
	</table>
	<script>

		function validateData(){
			var $validatePrice = $('#priceID').val().trim();
			if(	$('#nameID').val().trim() != false && 
				isNaN($('#nameID').val().trim()) == true && 
				$('#selectID').val() != 'notYet' && 
				isNaN($validatePrice) == false && 
				Number($validatePrice) > 0 &&
				 ( 
				 	(	$validatePrice.indexOf('.') > -1 && 
		 				($validatePrice.length - $validatePrice.indexOf('.')) < 3
	 				) //ensure only 2 decimal places
				 ||
				 	($validatePrice.indexOf('.') == -1)//no decimal number
			 	 )
			){
				$('#internalForm').submit();
			}else
				alert('the form gets some Error. Please check');
		}
		
		function reCalculate(){
			$('#oneC').text($('#selectBuyID').val());
			$('#allC').text((Number($('#quantity').val()) * Number($('#selectBuyID').val())));
			
		}
		
		var subtotalCost = 0, totalCost = 0;
		var categoryArrary = [], priceArrary = [];
		
		function validateBuying (){
			if($('#selectBuyID').val() != 'notYet' && ( isNaN($('#quantity').val()) == false)){
				 var selector = document.getElementById('selectBuyID');
				 var selectedOptionClass = selector[selector.selectedIndex].className;
				 var selectedOptionId = selector[selector.selectedIndex].id;
				 subtotalCost += Number($('#allC').text());
				 categoryArrary.push(selectedOptionClass);
				 priceArrary.push(Number($('#allC').text()));
				$('#ShoppingItems').append("<li class="+selectedOptionClass+">"+$('#'+selectedOptionId).text()+" "+$('#oneC').val()+" * "+$('#quantity').val()+ " , $: "+$('#allC').text()+"</li>");
				$('#subtotalCost').text(subtotalCost);
			}
		}
		
		var today = new Date();
		var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
		$(document).ready(function(){
			document.getElementById('now').innerText = time;
		});
	
		var areaSelector = document.getElementById('areaSelect');
		var CorrectTax;
		function AfterTaxSumCost(){
			CorrectTax = Number($('#taxUsed').text());
			if(areaSelector[areaSelector.selectedIndex].id == "Ca"){
				$('.food').css('color','green');
				for(var i=1;i<categoryArrary.length+1;i++){
					if(categoryArrary[i-1] != 'food')
						document.getElementsByTagName('li')[i].innerHTML += ", with "+ CorrectTax +"% tax ,  $"+ ( ((CorrectTax/100)) * priceArrary[i-1]).toFixed(2);
					priceArrary[i-1] = Number(( (1+ (CorrectTax/100)) * priceArrary[i-1]).toFixed(2));
				}
			}
			else if(areaSelector[areaSelector.selectedIndex].id == "NY"){
				$('.food').css('color','green');$('.clothing').css('color','green');
				for(var i=1;i<categoryArrary.length+1;i++){
					if(categoryArrary[i-1] != 'food' && categoryArrary[i-1] != 'clothing')
						document.getElementsByTagName('li')[i].innerHTML += ", with "+ CorrectTax +"% tax ,  $"+ ( ((CorrectTax/100)) * priceArrary[i-1]).toFixed(2);
					priceArrary[i-1] = Number(( (1+ (CorrectTax/100)) * priceArrary[i-1]).toFixed(2));
				}
			}else{
				for(var i=1;i<categoryArrary.length+1;i++){
					document.getElementsByTagName('li')[i].innerHTML += ", with "+ CorrectTax +"% tax ,  $"+ ( ((CorrectTax/100)) * priceArrary[i-1]).toFixed(2);
					priceArrary[i-1] = Number(( (1+ (CorrectTax/100)) * priceArrary[i-1]).toFixed(2));
				}
			}
	
			$("#totalCost").text(priceArrary.reduce(myFunc));
			$("#taxCost").text( ((priceArrary.reduce(myFunc)) - subtotalCost));
			
		}
		
		function myFunc(total, num) {
			  return total + num;
		}
	</script>
</body>
</html>