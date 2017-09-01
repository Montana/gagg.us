(function($){

	var restore_dims = function() {
		$( 'img[data-recalc-dims]' ).each( function recalc() {
			var $this = $( this );
			if ( this.complete ) {

				if ( $this.data( 'lazy-src' ) && $this.attr( 'src' ) !== $this.data( 'lazy-src' ) ) {
					$this.load( recalc );
					return;
				}

				var width = this.width,
					height = this.height;

				if ( width && width > 0 && height && height > 0 ) {
					$this.attr( {
						width: width,
						height: height
					} );

					reset_for_retina( this );
				}
			}
			else {
				$this.load( recalc );
			}
		} );
	},

	reset_for_retina = function( img ) {
		$( img ).removeAttr( 'data-recalc-dims' ).removeAttr( 'scale' );
	};
  
	$( document ).ready( restore_dims );

	if ( 'on' in $.fn ) {
		$( document.body ).on( 'post-load', restore_dims );
	} else {
		$( document ).delegate( 'body', 'post-load', restore_dims );
	}
})(jQuery);
