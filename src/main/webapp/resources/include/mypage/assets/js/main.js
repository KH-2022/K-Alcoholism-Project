$(function(){$(window).on("load",function(e){$("#preloader").delay(500).fadeOut(500)});$(window).on("scroll",function(e){var f=$(window).scrollTop();if(f<350){$(".header-menu").removeClass("sticky")}else{$(".header-menu").addClass("sticky")}});$(".header-menu-vertical .menu-title").on("click",function(e){$(".header-menu-vertical .menu-content").slideToggle(500)});$(".menu-expand").each(function(){var f=$(this),e=f.find(".menu-item:gt(11)"),g=f.hasClass("expanded");e[g?"show":"hide"]();if(e.length>0){f.append($('<li class="expand">'+(g?'<a href="javascript:;"><span><i class="ion-android-remove"></i>Close Categories</span></a>':'<a href="javascript:;"><span><i class="ion-android-add"></i>More Categories</span></a>')+"</li>").click(function(h){var i=f.hasClass("expanded");h.preventDefault();$(this).html(i?'<a href="javascript:;"><span><i class="ion-android-add"></i>More Categories</span></a>':'<a href="javascript:;"><span><i class="ion-android-remove"></i>Close Categories</span></a>');f.toggleClass("expanded");e.toggle(300)}))}});$(".menu-expand-2").each(function(){var f=$(this),e=f.find(".menu-item:gt(9)"),g=f.hasClass("expanded");e[g?"show":"hide"]();if(e.length>0){f.append($('<li class="expand">'+(g?'<a href="javascript:;"><span><i class="ion-android-remove"></i>Close Categories</span></a>':'<a href="javascript:;"><span><i class="ion-android-add"></i>More Categories</span></a>')+"</li>").click(function(h){var i=f.hasClass("expanded");h.preventDefault();$(this).html(i?'<a href="javascript:;"><span><i class="ion-android-add"></i>More Categories</span></a>':'<a href="javascript:;"><span><i class="ion-android-remove"></i>Close Categories</span></a>');f.toggleClass("expanded");e.toggle(300)}))}});$(".mobile-menu-open").on("click",function(){$(".mobile-off-canvas-menu").addClass("open");$(".overlay").addClass("open")});$(".close-mobile-menu").on("click",function(){$(".mobile-off-canvas-menu").removeClass("open");$(".overlay").removeClass("open")});$(".overlay").on("click",function(){$(".mobile-off-canvas-menu").removeClass("open");$(".overlay").removeClass("open")});var a=$(".mobile-canvas"),b=a.find(".dropdown-menu");b.parent().prepend('<span class="menu-expand"></span>');b.slideUp();a.on("click","li a, li .menu-expand",function(g){var f=$(this);if((f.parent().attr("class").match(/\b(menu-item-has-children|has-children|has-sub-menu)\b/))&&(f.attr("href")==="#"||f.hasClass("menu-expand"))){g.preventDefault();if(f.siblings("ul:visible").length){f.parent("li").removeClass("active-expand");f.siblings("ul").slideUp()}else{f.parent("li").addClass("active-expand");f.closest("li").siblings("li").find("ul:visible").slideUp();f.closest("li").siblings("li").removeClass("active-expand");f.siblings("ul").slideDown()}}});var a=$(".mobile-main-menu"),b=a.find(".mega-sub-menu, .sub-menu, .submenu-item ");b.parent().prepend('<span class="mobile-menu-expand"></span>');b.slideUp();a.on("click","li a, li .mobile-menu-expand, li .menu-title",function(g){var f=$(this);if((f.parent().attr("class").match(/\b(menu-item-has-children|has-children|has-sub-menu)\b/))&&(f.attr("href")==="#"||f.hasClass("mobile-menu-expand"))){g.preventDefault();if(f.siblings("ul:visible").length){f.parent("li").removeClass("active-expand");f.siblings("ul").slideUp()}else{f.parent("li").addClass("active-expand");f.closest("li").siblings("li").find("ul:visible").slideUp();f.closest("li").siblings("li").removeClass("active-expand");f.siblings("ul").slideDown()}}});function d(){var e=$(".slider-active");e.on("init",function(h,i){var g=$(".single-slider:first-child").find("[data-animation]");f(g)});e.on("beforeChange",function(i,k,h,j){var g=$('.single-slider[data-slick-index="'+j+'"]').find("[data-animation]");f(g)});e.slick({autoplay:true,autoplaySpeed:10000,pauseOnHover:false,dots:false,fade:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',responsive:[{breakpoint:767,settings:{dots:false,arrows:false}}]});function f(h){var g="webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";h.each(function(){var k=$(this);var i=k.data("delay");var j="animated "+k.data("animation");k.css({"animation-delay":i,"-webkit-animation-delay":i});k.addClass(j).one(g,function(){k.removeClass(j)})})}}d();$(".category-active").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:6,slidesToScroll:1,responsive:[{breakpoint:1200,settings:{slidesToShow:5,}},{breakpoint:992,settings:{slidesToShow:4,}},{breakpoint:768,settings:{slidesToShow:3,}},{breakpoint:576,settings:{slidesToShow:1,arrows:false,dots:true,}}]});$(".category-active-2").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:4,slidesToScroll:1,responsive:[{breakpoint:1600,settings:{slidesToShow:3,}},{breakpoint:1200,settings:{slidesToShow:3,}},{breakpoint:992,settings:{slidesToShow:4,}},{breakpoint:768,settings:{slidesToShow:3,}},{breakpoint:576,settings:{slidesToShow:1,arrows:false,dots:true,}}]});$(".product-active").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:6,slidesToScroll:1,responsive:[{breakpoint:1600,settings:{slidesToShow:5,}},{breakpoint:1200,settings:{slidesToShow:4,}},{breakpoint:992,settings:{slidesToShow:3,}},{breakpoint:768,settings:{slidesToShow:2,}},{breakpoint:576,settings:{slidesToShow:1,arrows:false,dots:true,}}]});$(".product-active-2").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:3,slidesToScroll:1,responsive:[{breakpoint:1600,settings:{slidesToShow:3,}},{breakpoint:1200,settings:{slidesToShow:2,}},{breakpoint:992,settings:{slidesToShow:2,}},{breakpoint:768,settings:{slidesToShow:1,}},{breakpoint:576,settings:{slidesToShow:1,arrows:false,dots:true,}}]});$(".product-active-3").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:4,slidesToScroll:1,responsive:[{breakpoint:1600,settings:{slidesToShow:3,}},{breakpoint:1200,settings:{slidesToShow:2,}},{breakpoint:992,settings:{slidesToShow:3,}},{breakpoint:768,settings:{slidesToShow:2,}},{breakpoint:576,settings:{slidesToShow:1,arrows:false,dots:true,}}]});$(".product-active-4").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:4,slidesToScroll:1,responsive:[{breakpoint:1600,settings:{slidesToShow:3,}},{breakpoint:1200,settings:{slidesToShow:2,}},{breakpoint:992,settings:{slidesToShow:1,}},{breakpoint:768,settings:{slidesToShow:1,}},{breakpoint:576,settings:{slidesToShow:1,arrows:false,dots:true,}}]});$(".brand-active").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:6,slidesToScroll:1,responsive:[{breakpoint:1600,settings:{slidesToShow:6,}},{breakpoint:1200,settings:{slidesToShow:6,}},{breakpoint:992,settings:{slidesToShow:4,}},{breakpoint:768,settings:{slidesToShow:3,}},{breakpoint:576,settings:{slidesToShow:2,arrows:false,}}]});$(".blog-active").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:3,slidesToScroll:1,responsive:[{breakpoint:1200,settings:{slidesToShow:3,}},{breakpoint:992,settings:{slidesToShow:2,}},{breakpoint:768,settings:{slidesToShow:1,arrows:false,}}]});$(".special-products-active").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:true,speed:800,});$(".testimonial-active").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:true,speed:800,});$(".products-gallery-image").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:false,fade:true,asNavFor:".products-thumb",speed:400,});$(".products-thumb").slick({slidesToShow:4,slidesToScroll:1,asNavFor:".products-gallery-image",dots:false,arrows:false,focusOnSelect:true,vertical:true,speed:400,});$(".product-gallery-image-2").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:false,fade:true,asNavFor:".products-thumb-2",speed:400,});$(".product-thumb-2").slick({slidesToShow:4,slidesToScroll:1,asNavFor:".product-gallery-image-2",dots:false,arrows:false,focusOnSelect:true,speed:400,});$(".quick-view-image").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:false,fade:true,asNavFor:".quick-view-thumb",speed:400,});$(".quick-view-thumb").slick({slidesToShow:4,slidesToScroll:1,asNavFor:".quick-view-image",dots:false,arrows:false,focusOnSelect:true,speed:400,});$(".product-single-image").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:false,fade:true,asNavFor:".product-single-thumb",speed:400,});$(".product-single-thumb").slick({slidesToShow:4,slidesToScroll:1,asNavFor:".product-single-image",dots:false,arrows:false,focusOnSelect:true,speed:400,});$(".product-single-image-tab").slick({slidesToShow:1,slidesToScroll:1,arrows:false,dots:false,fade:true,asNavFor:".product-single-thumb-tab",speed:400,});$(".product-single-thumb-tab").slick({slidesToShow:4,slidesToScroll:1,asNavFor:".product-single-image-tab",dots:false,arrows:false,focusOnSelect:true,speed:400,vertical:true,});$(".single-product-image-slide").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:3,slidesToScroll:1,responsive:[{breakpoint:1200,settings:{slidesToShow:3,}},{breakpoint:992,settings:{slidesToShow:3,}},{breakpoint:768,settings:{slidesToShow:2,}}]});$(".blog-gallery").slick({dots:false,infinite:true,arrows:true,prevArrow:'<span class="prev"><i class="fal fa-chevron-left"></i></span>',nextArrow:'<span class="next"><i class="fal fa-chevron-right"></i></span>',speed:800,slidesToShow:1,slidesToScroll:1,});$(".add").click(function(){if($(this).prev().val()){$(this).prev().val(+$(this).prev().val()+1)}});$(".sub").click(function(){if($(this).next().val()>1){if($(this).next().val()>1){$(this).next().val(+$(this).next().val()-1)}}});$("[data-countdown]").each(function(){var e=$(this),f=$(this).data("countdown");e.countdown(f,function(g){e.html(g.strftime('<div class="countdown-time d-flex flex-wrap"><div class="single-countdown"><span class="countdown-amount">%D</span><span class="countdown-period">Days</span></div><div class="single-countdown"><span class="countdown-amount">%H</span><span class="countdown-period">Hours</span></div><div class="single-countdown"><span class="countdown-amount">%M</span><span class="countdown-period">Mins</span></div><div class="single-countdown"><span class="countdown-amount">%S</span><span class="countdown-period">Secs</span></div></div>'))})});$("[data-shipping]").on("click",function(){if($("[data-shipping]:checked").length>0){$("#shipping-address").slideDown()}else{$("#shipping-address").slideUp()}});var c=$(".sin-payment input:checked");if(c){$(c).siblings(".payment-box").slideDown(300)}$(".sin-payment input").on("change",function(){$(".payment-box").slideUp(300);$(this).siblings(".payment-box").slideToggle(300)});var c=$(".payment-radio input:checked");if(c){$(c).siblings(".payment-details").slideDown(500)}$(".payment-radio input").on("change",function(){$(".payment-details").slideUp(500);$(this).siblings(".payment-details").slideToggle(500)});$(window).on("scroll",function(e){if($(this).scrollTop()>600){$(".back-to-top").fadeIn(200)}else{$(".back-to-top").fadeOut(200)}});$(".back-to-top").on("click",function(e){e.preventDefault();$("html, body").animate({scrollTop:0,},1500)});$("#slider-range").slider({range:true,min:0,max:500,values:[75,300],slide:function(e,f){$("#amount").val("€"+f.values[0]+" - €"+f.values[1])}});$("#amount").val("€"+$("#slider-range").slider("values",0)+" - €"+$("#slider-range").slider("values",1))});