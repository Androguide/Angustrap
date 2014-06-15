angular.module('Angustrap', [])

  // Glyphicons
  // ----------
  // Shortcut directive for Bootstrap's glyphicons.<br/><br/>
  // **Example**:<br/>
  // ```html
  // <glyph icon="heart"></glyph>
  // ```
  // <br/>
  // _For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_
  .directive('glyph', function() {
    var defObj = {
      restrict: 'E',
      replace: true,
      scope: { icon: '@icon' },
      template: '<span class="glyphicon glyphicon-{{icon}}"></span>'
    };
    return defObj;
  })

  // Dropdowns
  // ---------
  // Fully markup-driven directives to abstract
  // Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
  // _Note that you can still pass the usual ```dropdown-menu-right``` class to right-align the dropdown relatively to its parent_

  // ### Dropdown Item
  // This is the `<dropdown-item>` directive used through transclusion by the other dropdown directives.
  .directive('dropdownItem', function() {
    var defObj = {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'templates/dropdowns/dropdown-item.html',
      scope: { asHref: '@asHref' }
    };
    return defObj;
  })

  // TODO: Dropdown divider directive

  //
  // ### Regular Dropdown
  // **Example**:<br/>
  // ```html
  // <dropdown as-id="myDropdown">
  //     <dropdown-item as-href="http://google.com">Google</dropdown-item>
  //     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
  // </dropdown>
  // ```
  .directive('dropdown', function() {
    var defObj = {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'templates/dropdowns/dropdown.html',
      scope: {
        asId: '@asId'
      }
    };
    return defObj;
  })

  // ### Single-button dropdown
  // **Example**:<br/>
  // ```html
  // <btn-dropdown as-id="myDropdown" theme="danger" size="lg">
  //     <dropdown-item as-href="http://google.com">Google</dropdown-item>
  //     <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
  // </btn-dropdown>
  // ```
  .directive('btnDropdown', function($timeout) {
    var defObj = {
      restrict: 'E',
      replace: true,
      transclude: true,
      templateUrl: 'templates/dropdowns/button-dropdown.html',
      scope: {
        asId: '@asId',
        theme: '@theme',
        size: '@size'
      },
      link: function(scope, el, attrs) {
        // Specifying an `as-id="someId"` attribute is mandatory, return an error if none was found or if it's empty.
        if (typeof attrs.asId === 'undefined' || attrs.asId === '') {
          return console.log('Angustrap: ERROR - You must define an ID for this dropdown, using the as-id="yourId" attribute');
        }

        // If no `theme="primary|success|info|warning|danger"` attribute was passed, we default back to the `.btn-default` class.
        if (typeof attrs.theme === 'undefined' || attrs.theme === '') attrs.theme = 'default';

        // Clean-up empty class prefix if no size attribute is specified
        var handleSize = function() {
          if (typeof attrs.size === 'undefined' || attrs.size === '')
            angular.element('#' + attrs.asId).removeClass('btn-');
        }
        // This $timeout is a workaround so that our function is not executed before the DOM is loaded
        $timeout(handleSize, 0);
      }
    };
    return defObj;
  })

;
