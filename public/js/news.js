////////////
// todo/fix:
//   add hotkey shortcuts  for
//   - headlines, fulltext, snippets


function showHeadlines()
{
     console.log( 'showHeadlines' );
    $( '.item' ).each( function() {
        closeItem( $(this) );
    });
}

function showFullText() {
    console.log( 'showFullText' );
    $( '.item' ).each( function() {
        openItem( $(this) );
        hideItemSnippet( $(this) );
    });
}

function showSnippets() {
    console.log( 'showSnippets' );
    $( '.item' ).each( function() {
        openItem( $(this) );
        showItemSnippet( $(this) );
    });
    
    // todo: set opacity 1.0 and 0.25 for all others!!!
    //  or set active
}



function showItemSnippet( $item ) // alias - hideItemFullText
{
  $item.find( '.item-summary,.item-content' ).hide();
  $item.find( '.item-snippet' ).show();
}

function hideItemSnippet( $item )  // alias - showItemFullText
{
  $item.find( '.item-summary,.item-content' ).show();
  $item.find( '.item-snippet' ).hide();
}


function closeItem( $item ) {
  $item.find( '.item-body' ).hide();
}

function openItem( $item ) {
  $item.find( '.item-body' ).show();
}



$(document).ready( function() {
  $( '#show-headlines' ).click( showHeadlines );
  $( '#show-fulltext' ).click( showFullText );
  $( '#show-snippets' ).click( showSnippets );
});

