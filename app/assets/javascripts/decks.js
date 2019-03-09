// $(document).ready(function(){
//     $('.card-chosen').change(function(){
//       changeCard($(this));
//     });
//   });

// function changeCard(thisCard){
//   var cardStats = thisCard.parent().parent().find('.card-stats');
//   var cardChoice = thisCard.find(":selected").val();
//   var cardImage = thisCard.next();
//   var cardType = thisCard.parent().parent().find('.card-type');
//   var cardLeague = thisCard.parent().parent().find('.card-league');
//   var cardSquadSize = thisCard.parent().parent().find('.card-squad-size');
//   var cardHealth = thisCard.parent().parent().find('.card-health');

//   console.log(cardStats);
//   $(cardStats).show();


//   if(cardChoice == 'Archer'){
//     $(cardImage).attr("src", 'https://gamepedia.cursecdn.com/riseoflegions_gamepedia_en/0/08/Archers_white.png');
//     $(cardType).html('Summon')
//     $(cardLeague).html('Stone')
//     $(cardSquadSize).html('2')
//     $(cardHealth).html('23')
//   }else if(cardChoice == 'Footmen'){
//     $(cardImage).attr("src", 'https://gamepedia.cursecdn.com/riseoflegions_gamepedia_en/d/dd/Footmen_white.png');
//     $(cardType).html('Summon')
//     $(cardLeague).html('Stone')
//     $(cardSquadSize).html('4')
//     $(cardHealth).html('36')
//   }
// };