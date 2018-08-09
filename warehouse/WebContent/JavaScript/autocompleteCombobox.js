function filterFunction() {
  		var input, filter, a, i;

 		 input = document.getElementById("myInput");
 
			 filter = input.value.toUpperCase();
			  //div = document.getElementById("myDropdown");

			  a = document.getElementsByName("combobox");

			  for (i = 0; i < a.length; i++) {
			 	//alert(a[i].innerHTML);
			   if (a[i].innerHTML.toUpperCase().startsWith(filter)) {
				   for(var j=0;j<a.length;j++){
					   a[j].style.display="block";
					   a[j].style.backgroundColor = "white";
				   }
				   document.getElementById("noMatchingSentence").style.display="none";
				   a[i].scrollIntoView();
				   a[i].style.backgroundColor = "skyblue";
				   break;
			  
			  } else {
				  document.getElementById("noMatchingSentence").style.display="block";
				  document.getElementById("noMatchingSentence").style.color="red";
				  a[i].style.display = "none";
			    }
			  }
			  
			}
			function show(){
				//alert(arguments[0]);
				document.getElementById("myInput").value=arguments[0];
			}
			function filterFunction1() {
		  		var input, filter, a, i;

		 		 input = document.getElementById("idcbouserlevel");
		 
					 filter = input.value.toUpperCase();
					  //div = document.getElementById("myDropdown1");

					  a = document.getElementsByName("combobox1");

					  for (i = 0; i < a.length; i++) {
					 	//alert(a[i].innerHTML);
					   if (a[i].innerHTML.toUpperCase().startsWith(filter)) {
						   for(var j=0;j<a.length;j++){
							   a[j].style.display="block";
							   a[j].style.backgroundColor = "white";
						   }
						   document.getElementById("noMatchingSentence1").style.display="none";
						   a[i].scrollIntoView();
						   a[i].style.backgroundColor = "skyblue";
						   break;
					  
					  } else {
						  document.getElementById("noMatchingSentence1").style.display="block";
						  document.getElementById("noMatchingSentence1").style.color="red";
						  a[i].style.display = "none";
					    }
					  }
					  beforeSubmit();
					}
					function show1(){
						//alert(arguments[0]);
						document.getElementById("idcbouserlevel").value=arguments[0];
						beforeSubmit();
					}
					
					//for Category from subCategory Add
					function filterFunction2() {
				  		var input, filter, a, i;

				 		 input = document.getElementById("idcboCategory");
				 
							 filter = input.value.toUpperCase();
							  //div = document.getElementById("myDropdown1");

							  a = document.getElementsByName("combobox");

							  for (i = 0; i < a.length; i++) {
							 	//alert(a[i].innerHTML);
							   if (a[i].innerHTML.toUpperCase().startsWith(filter)) {
								   for(var j=0;j<a.length;j++){
									   a[j].style.display="block";
									   a[j].style.backgroundColor = "white";
								   }
								   document.getElementById("noMatchingSentence").style.display="none";
								   a[i].scrollIntoView();
								   a[i].style.backgroundColor = "skyblue";
								   break;
							  
							  } else {
								  document.getElementById("noMatchingSentence").style.display="block";
								  document.getElementById("noMatchingSentence").style.color="red";
								  a[i].style.display = "none";
							    }
							  }
							}
							function show2(){
								//alert(arguments[0]);
								document.getElementById("idcboCategory").value=arguments[0];
							}
							function filterBrand() {
						  		var input, filter, a, i;

						 		 input = document.getElementById("brandInput");
						 
									 filter = input.value.toUpperCase();
									  //div = document.getElementById("myDropdown1");

									  a = document.getElementsByName("combobox1");

									  for (i = 0; i < a.length; i++) {
									 	//alert(a[i].innerHTML);
									   if (a[i].innerHTML.toUpperCase().indexOf(filter)>-1) {
										   for(var j=0;j<a.length;j++){
											   a[j].style.display="block";
											   a[j].style.backgroundColor = "white";
										   }
										   document.getElementById("noMatchingSentenceForBrand").style.display="none";
										   a[i].scrollIntoView();
										   a[i].style.backgroundColor = "skyblue";
										   break;
									  
									  } else {
										  document.getElementById("noMatchingSentenceForBrand").style.display="block";
										  document.getElementById("noMatchingSentenceForBrand").style.color="red";
										  a[i].style.display = "none";
									    }
									  }
									}
							function filterBrandFromSubEdit() {
						  		var input, filter, a, i;

						 		 input = document.getElementById("idBrandFromSubEdit");
						 
									 filter = input.value.toUpperCase();
									  //div = document.getElementById("myDropdown1");

									  a = document.getElementsByName("brandFromSubEdit");

									  for (i = 0; i < a.length; i++) {
									 	//alert(a[i].innerHTML);
									   if (a[i].innerHTML.toUpperCase().indexOf(filter)>-1) {
										   for(var j=0;j<a.length;j++){
											   a[j].style.display="block";
											   a[j].style.backgroundColor = "white";
										   }
										   document.getElementById("noMatchingSentenceFromSubEdit").style.display="none";
										   a[i].scrollIntoView();
										   a[i].style.backgroundColor = "skyblue";
										   break;
									  
									  } else {
										  document.getElementById("noMatchingSentenceFromSubEdit").style.display="block";
										  document.getElementById("noMatchingSentenceFromSubEdit").style.color="red";
										  a[i].style.display = "none";
									    }
									  }
									}
							function filterSubCategory() {
						  		var input, filter, a, i;

						 		 input = document.getElementById("subCategoryInput");
						 
									 filter = input.value.toUpperCase();
									  //div = document.getElementById("myDropdown1");

									  a = document.getElementsByName("combobox");

									  for (i = 0; i < a.length; i++) {
									 	//alert(a[i].innerHTML);
									   if (a[i].innerHTML.toUpperCase().indexOf(filter)>-1) {
										   for(var j=0;j<a.length;j++){
											   a[j].style.display="block";
											   a[j].style.backgroundColor = "white";
										   }
										   document.getElementById("noMatchingSentenceForSubCategory").style.display="none";
										   a[i].scrollIntoView();
										   a[i].style.backgroundColor = "skyblue";
										   break;
									  
									  } else {
										  document.getElementById("noMatchingSentenceForSubCategory").style.display="block";
										  document.getElementById("noMatchingSentenceForSubCategory").style.color="red";
										  a[i].style.display = "none";
									    }
									  }
									}
							function filterCategoryFromSubEdit(){
						  		var input, filter, a, i;

						 		 input = document.getElementById("idcboCategory2");
						 
									 filter = input.value.toUpperCase();
									  //div = document.getElementById("myDropdown1");

									  a = document.getElementsByName("categoryFromSubEdit");

									  for (i = 0; i < a.length; i++) {
									 	//alert(a[i].innerHTML);
									   if (a[i].innerHTML.toUpperCase().startsWith(filter)) {
										   for(var j=0;j<a.length;j++){
											   a[j].style.display="block";
											   a[j].style.backgroundColor = "white";
										   }
										   document.getElementById("noMatchingSentenceCategoryFromSubEdit").style.display="none";
										   a[i].scrollIntoView();
										   a[i].style.backgroundColor = "skyblue";
										   break;
									  
									  } else {
										  document.getElementById("noMatchingSentenceCategoryFromSubEdit").style.display="block";
										  document.getElementById("noMatchingSentenceCategoryFromSubEdit").style.color="red";
										  a[i].style.display = "none";
									    }
									  }
									};
									
									function show3(){
										//alert(arguments[0]);
										document.getElementById("idcboCategory2").value=arguments[0];
										beforeSubmit();
			}
					function filterSubCategoryEdit() {
				  		var input, filter, a, i;

				 		 input = document.getElementById("subCategoryEditFromBrand");
				 		 	//alert(input.value);
							 filter = input.value.toUpperCase();
							  //div = document.getElementById("myDropdown1");

							  a = document.getElementsByName("combobox1");

							  for (i = 0; i < a.length; i++) {
							 	//alert(a[i].innerHTML);
							   if (a[i].innerHTML.toUpperCase().indexOf(filter)>-1) {
								   for(var j=0;j<a.length;j++){
									   a[j].style.display="block";
									   a[j].style.backgroundColor = "white";
								   }
								   document.getElementById("noMatchingSentenceSubCategoryFromBrandEdit").style.display="none";
								   a[i].scrollIntoView();
								   a[i].style.backgroundColor = "skyblue";
								   break;
							  
							  } else {
								  document.getElementById("noMatchingSentenceSubCategoryFromBrandEdit").style.display="block";
								  document.getElementById("noMatchingSentenceSubCategoryFromBrandEdit").style.color="red";
								  a[i].style.display = "none";
							    }
							  }
							}