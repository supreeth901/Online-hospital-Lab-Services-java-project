$(function(){ //  expanding more link of issue page and search page for abstract

		$('.show_full_abstract').click(function( e ){

			
			e.preventDefault();

			var authors = $( this ).parent().siblings('.authors').text();

			authors = authors.substring( 9, authors.length );
			console.log( authors );

			$.ajax({

				url:'/index.php/issue/get_abstract',
				data:{'authors':authors},
				dataType:'text',
				type:'POST',

				beforesend:function(){

					console.log('before');

					$('.modal').modal('show');

					$('.modal-content').html('<i class="glyphicon glyphicon-refresh"></i> Loading...');

				},
				success:function( data ){

					console.log('after');
					console.log(data);


					var result = $.trim( data.toString() );
					//prompt(result);

					$('.modal').modal('show');
					console.log(result);
					
					$('.modal-content').html('<h4>Abstract:</h4><hr>'+ result );

				},
				error:function(){
					alert('Something went wrong in getting Abstract');
				}
			});
			
		});
	});

//  enabling/disabling request to become reviewer mode
		

$(function(){

			

			$.ajax({

				url:'/ijbaar/index.php/user/get_user_status',
				data:'s',
				dataType:'text',

				type:'POST',

				success:function( data ){

					var result = $.trim( data.toString() );

					if( result >= 5 ){

						$('#request_reviewer').addClass('disabled');

					}
					if( result <= 5  ){

						$('#reviewer_mode_switch').addClass('disabled');

						$('#reviewer_mode_switch').bind('click', false);
					}
					
				}
			});

			

			$('#request_reviewer').click(function( e ){

				e.preventDefault();

				$.ajax({

					url:'/ijbaar/index.php/user/get_user_status',
					data:'s',
					dataType:'text',
					type:'POST',

					success:function( data ){

						var result = $.trim( data.toString() );

						if( result >= 5 ){

							$('#request_reviewer').addClass('disabled');
							$('#request_reviewer').removeAttr("href");
						}
						if( result < 5  ){

							window.location = '/ijbaar/index.php/user/request_to_become_reviewer';

						}
					}
				});

			
			});

		});
		
function configureDropDownLists(ddl1,ddl2) {
    var agriculture = new Array('Agricultural Communication', 'Agricultural Economics', 'Agrometerology', 'Agronomy', 'Entomology', 'Food Science and Technology', 'Genetics and Plant Breeding', 'Horticulture', 'Plant Pathology', 'Soil Science', 'Vegetable Science');
    var agribusiness_Management = new Array('Business Economics and Policy', 'Finance Management', 'Human Resource and Personnel Management', 'Marketing Management', 'Production Management');
    var basic_Science_and_Humanities = new Array('Biochemistry', 'Biological Science', 'Chemistry', 'Environmental Science', 'Humanities & Social Sciences', 'Mathematics, Statistics & Computer Science', 'Microbiology', 'Molecular Biology & Genetic Engineering', 'Physics', 'Plant Physiology', 'Radio And Isotopes','Bioinformatics');
    var fisheries = new Array('Aquaculture', 'Fishery Biology', 'Fishery Hydrography', 'Fish Processing Technology', 'Fisheries Extension Education');
    var home_Science = new Array('Clothing and Textiles', 'Family Resource Management', 'Human Development and Family Studies', 'Foods and Nutrition', 'Home Science Extension');
    var technology= new Array('Civil Engineering', 'Computer Engineering', 'Electrical Engineering', 'Electronics and Communication Engineering', 'Farm Machinery and Power Engineering', 'Information Technology', 'Irrigation and Drainage Engineering', 'Mechanical Engineering', 'Post Harvest Process and Food Engineering', 'Industrial and Production Engineering', 'Soil and Water Conservation Engineering');
    var veterinary_and_Animal_Sciences = new Array('Animal Nutrition', 'Animal Genetics & Breeding', 'Livestock Production Management', 'Livestock Products Technology', 'Veterinary Anatomy', 'Veterinary Animal Husbandry & Extension Education', 'Veterinary Gynaecology & Obstetrics', 'Veterinary Medicine', 'Veterinary Microbiology', 'Veterinary Parasitology', 'Veterinary Pathology', 'Veterinary Pharmacology & Toxicology', 'Veterinary Physiology & Biochemistry', 'Veterinary Public Health  & Epidemiology', 'Veterinary Surgery & Radiology');
    

    switch (ddl1.value) {
        case 'Agriculture':
            ddl2.options.length = 0;
            for (i = 0; i < agriculture.length; i++) {
                createOption(ddl2, agriculture[i], agriculture[i]);
            }
            break;
        case 'Agribusiness_Management':
            ddl2.options.length = 0; 
	        for (i = 0; i < agribusiness_Management.length; i++) {
	            createOption(ddl2, agribusiness_Management[i], agribusiness_Management[i]);
	        }
            break;
        case 'Basic_Science_and_Humanities':
            ddl2.options.length = 0;
            for (i = 0; i < basic_Science_and_Humanities.length; i++) {
                createOption(ddl2, basic_Science_and_Humanities[i], basic_Science_and_Humanities[i]);
            }
            break;

        case 'Fisheries':
            ddl2.options.length = 0;
            for (i = 0; i < fisheries.length; i++) {
                createOption(ddl2, fisheries[i], fisheries[i]);
            }
            break;
        case 'Home_Science':
            ddl2.options.length = 0; 
        for (i = 0; i < home_Science.length; i++) {
            createOption(ddl2, home_Science[i], home_Science[i]);
            }
            break;
        case 'Technology':
            ddl2.options.length = 0;
            for (i = 0; i < technology.length; i++) {
                createOption(ddl2, technology[i], technology[i]);
            }
            break;

        case 'Veterinary_and_Animal_Sciences':
            ddl2.options.length = 0;
            for (i = 0; i < veterinary_and_Animal_Sciences.length; i++) {
                createOption(ddl2, veterinary_and_Animal_Sciences[i], veterinary_and_Animal_Sciences[i]);
            }
            break;

       

            default:
                ddl2.options.length = 0;
            break;
    }

}

    function createOption(ddl, text, value) {
        var opt = document.createElement('option');
        opt.value = value;
        opt.text = text;
        ddl.options.add(opt);
    }