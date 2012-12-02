function add_related_item() {
  related_item = $(".related_items .group.first").clone();
  related_item.removeClass('first');
  related_item_select = related_item.children("select");
  related_item_select.attr('name', related_item_select.attr('name').split('_')[0] + "_" + (parseInt(related_item_select.attr('name').split('_')[1]) + 1) + "]")
  $(".related_items").append(related_item);
}
