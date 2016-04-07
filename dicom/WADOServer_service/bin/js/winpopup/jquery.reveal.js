/*
* jQuery Reveal Plugin 1.0
* www.ZURB.com
* Copyright 2010, ZURB
* Free to use under the MIT license.
* http://www.opensource.org/licenses/mit-license.php
*/
var z_index_default = 0; /*100000;*/
var z_index = 0;/*100000;*/

(function ($) {

    /*---------------------------
    Defaults for Reveal
    ----------------------------*/

    /*---------------------------
    Listener for data-reveal-id attributes
    ----------------------------*/

    $('*[data-reveal-id]').live('click', function (e) {
        e.preventDefault();
        var modalLocation = $(this).attr('data-reveal-id');
        $('#' + modalLocation).reveal($(this).data());
    });

    /*---------------------------
    Extend and Execute
    ----------------------------*/

    $.fn.reveal = function (options) {


        var defaults = {
            animation: 'fadeAndPop', //fade, fadeAndPop, none
            animationspeed: 300, //how fast animtions are
            closeonbackgroundclick: true, //if you click background will modal close?
            dismissmodalclass: 'close-reveal-modal' //the class of a button or element that will close an open modal
        };

        //Extend dem' options
        var options = $.extend({}, defaults, options);

        return this.each(function () {

            /*---------------------------
            Global Variables
            ----------------------------*/
            var modal = $(this),
				topOffset = modal.height() + topMeasure,
          		locked = false,
				topMeasure;

          //  if (z_index == z_index_default) {
           //     $(this).css('left', '50%');
                if (!$(this).hasClass('noAutoOverflowRevealModal')){
                    $(this).css('overflow', 'auto');
                }
                $(this).css('margin-left', -parseInt(parseInt(modal.css('width')) / 2));
                topMeasure = 100;
//            } else {
//                $(this).css('left', '0');
//                topMeasure = 30;
//            }



            var modalBG = $('div[data-for="' + $(this).attr('id') + '"].reveal-modal-bg');

            if (modalBG.length == 0) {
                modalBG = $('<div class="reveal-modal-bg" data-for="' + $(this).attr('id') + '"/>').insertAfter(modal);
            }
            $(modal).css('z-index', z_index + 2);
            $(modalBG).css('z-index', z_index + 1);
            z_index = z_index + 2;
            /*---------------------------
            Open & Close Animations
            ----------------------------*/
            //Entrance Animations
            modal.bind('reveal:open', function () {
                modalBG.unbind('click.modalEvent');
                $('*[data-for="' + $(modal).attr('id') + '"].' + options.dismissmodalclass).unbind('click.modalEvent');
                if (!locked) {
                    lockModal();
                    if (options.animation == "fadeAndPop") {
                        modal.css({ 'top': $(document).scrollTop() - topOffset, 'opacity': 0, 'visibility': 'visible' });
                        modalBG.fadeIn(options.animationspeed / 2);
                        modal.delay(options.animationspeed / 2).animate({
                         //   "top": $(document).scrollTop() + topMeasure + 'px',
                              "top": topMeasure + 'px',
                            "opacity": 1
                        }, options.animationspeed, unlockModal());
                    }
                    if (options.animation == "fade") {
//                        modal.css({ 'opacity': 0, 'visibility': 'visible', 'top': $(document).scrollTop() + topMeasure });
                        modal.css({ 'opacity': 0, 'visibility': 'visible', 'top': topMeasure });
                        modalBG.fadeIn(options.animationspeed / 2);
                        modal.delay(options.animationspeed / 2).animate({
                            "opacity": 1
                        }, options.animationspeed, unlockModal());
                    }
                    if (options.animation == "none") {
//                        modal.css({ 'visibility': 'visible', 'top': $(document).scrollTop() + topMeasure });
                        modal.css({ 'visibility': 'visible', 'top': topMeasure });
                        modalBG.css({ "display": "block" });
                        unlockModal()
                    }
                }
                modal.unbind('reveal:open');
            });

            //Closing Animation
            modal.bind('reveal[data-for=' + $(modal).attr('id') + ']:close', function () {
                if (!locked) {
                    lockModal();
                    if (options.animation == "fadeAndPop") {
                        modalBG.delay(options.animationspeed).fadeOut(options.animationspeed);
                        modal.animate({
                            "top": $(document).scrollTop() - topOffset + 'px',
                            "opacity": 0
                        }, options.animationspeed / 2, function () {
                            modal.css({ 'top': topMeasure, 'opacity': 1, 'visibility': 'hidden' });
                            unlockModal();
                        });
                    }
                    if (options.animation == "fade") {
                        modalBG.delay(options.animationspeed).fadeOut(options.animationspeed);
                        modal.animate({
                            "opacity": 0
                        }, options.animationspeed, function () {
                            modal.css({ 'opacity': 1, 'visibility': 'hidden', 'top': topMeasure });
                            unlockModal();
                        });
                    }
                    if (options.animation == "none") {
                        modal.css({ 'visibility': 'hidden', 'top': topMeasure });
                        modalBG.css({ 'display': 'none' });

                    }
                }
                z_index = z_index - 2;
                modal.unbind('reveal[data-for=' + $(modal).attr('id') + ']:close');
            });

            /*---------------------------
            Open and add Closing Listeners
            ----------------------------*/
            //Open Modal Immediately
            modal.trigger('reveal:open');

            //Close Modal Listeners
            var closeButton = $('*[data-for="' + $(modal).attr('id') + '"].' + options.dismissmodalclass).bind('click.modalEvent', function () {
                modal.trigger('reveal[data-for=' + $(modal).attr('id') + ']:close');
                return false;
            });

            if (options.closeonbackgroundclick) {
                modalBG.css({ "cursor": "pointer" })
                modalBG.bind('click.modalEvent', function () {
                    modal.trigger('reveal[data-for=' + $(modal).attr('id') + ']:close')
                });
            }

            /*
            $('body').keyup(function (e) {
            if (e.which === 27) { modal.trigger('reveal[for=' + $(modal).attr('id') + ']:close'); } // 27 is the keycode for the Escape key
            });
            */

            /*---------------------------
            Animations Locks
            ----------------------------*/
            function unlockModal() {
                locked = false;
            }
            function lockModal() {
                locked = true;
            }

        }); //each call
    } //orbit plugin call
})(jQuery);