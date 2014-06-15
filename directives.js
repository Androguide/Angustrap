angular.module('Angustrap', [])

  // Glyphicons
  // ----------
  // Shortcut directive for Bootstrap's glyphicons.<br/><br/>
  // **Example**:<br/>
  // ```html
  // <glyph icon="'copyright-mark'"></glyph>
  // ```
  // <br/>
  // _For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_
  .directive('glyph', function() {
    return {
      restrict: 'E',
      replace: true,
      scope: { icon: '=icon' },
      template: '<span class="glyphicon glyphicon-{{icon}}"></span>'
    }
  })

  // Dropdowns
  // ---------
  // A fully markup-driven directive to abstract
  // Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) component.<br/><br/>
  // **Example**:<br/>
  // ```html
  // <dropdown as-id="'myDropdown'" items="['First', 'Second', 'Third', 'Fourth', 'etc...']"></dropdown>
  // ```
  // _Note that you can still pass the usual ```dropdown-menu-right``` class to right-align the dropdown relatively to its parent_
  .directive('dropdown', function() {
    return {
      restrict: 'E',
      replace: true,
      templateUrl: 'dropdowns.html',
      scope: {
        asId: "=asId",
        items: "=items"
      }
    }
  })
;
