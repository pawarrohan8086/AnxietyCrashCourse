        function openNav() {
            document.getElementById("mySidebar").style.width = "20%";
            document.getElementById("main").style.marginLeft = "0px";
        }

        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
            document.getElementById("main").style.marginLeft= "50px";
        }
        
    	$(document).ready(function () {
    		$('#asidebarCollapse').on('click', function () {
    			$('#asidebar').toggleClass('active');
    		});
    	});