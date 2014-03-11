'use strict';

$(document).ready(initialize);

function initialize(){
  if ($('body.plays').length) {
    createFields();
    modifyForm();
    $('#play-form-container').on('click', '#add-player', clickAddPlayer);
    $('#player-name').focus();
  }
}

function clickAddPlayer(){
  var currentList = $('#players').val();
  var newItem = $('#player-name').val();
  $('#players').val(CSVify(currentList, newItem));
  $('#player-name').val("").focus();
}

function createFields(){
  var $row = $('<div>').addClass('row');
  var $row2 = $row.clone().addClass('collapse');
  var $container = $('<div>').addClass('columns');
  var $label = $('<label>').attr('for', 'player-name').text('Player to add')
  var $textField = $('<input>').attr('id', 'player-name').attr('type', 'text');
  var $button = $('<input>').attr('id', 'add-player').attr('type', 'button').addClass('postfix radius');
  $button.val('Add Player').addClass('button tiny');
  $row.append($container.clone().addClass('small-12').append($label));
  $row2.append($container.clone().addClass('small-4').append($textField));
  $row2.append($container.clone().addClass('small-2').append($button));
  $row2.append($container.clone().addClass('small-6'));
  $('.section.play').prepend($row2).prepend($row);
}

function CSVify(currentList, newItem) {
  var newList;
  if (currentList.length > 0) {
    newList = currentList.split(', ');
    newList.push(newItem);
    newList = newList.join(', ');
  } else {
    newList = newItem;
  }
  return newList
}

function modifyForm() {
  $('#players-label').text('Players:');
  $('#players').attr('readonly', 'readonly').addClass('disabled-field');
}