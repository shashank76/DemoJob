$(window).load(function() {
if ($('.pagination_block').find('.pagination').length) {
paginate();
return $(window).scroll();
}
});

function paginate(){	
$(window).scroll(function() {
var url;
url = $('.pagination .next_page').attr('href');
// alert('fgfgf2');
if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
$('.pagination').show().html("<img src='https://s3-eu-west-1.amazonaws.com/1stspade-email-images/images/22.gif'>");
return $.getScript(url);
}
});
}


// function pagination_(){
// $(window).scroll(function() {
// var url;
// url = $('.detail-pagination .pagination .next_page').attr('href');
// console.log(url);
// if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
// $('.detail-pagination .pagination').show().html("<img src=' https://s3-eu-west-1.amazonaws.com/1stspade-email-images/images/22.gif'>");
// return $.getScript(url);
// }
// });
// }