Angustrap
=========

Concise &amp; Markup-driven AngularJS Directives for Bootstrap.


###Glyphicons
Shortcut directive for Bootstrap's glyphicons.

**Example**:
```html
<glyph icon="'copyright-mark'"></glyph>
```

_For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_


###Dropdowns
A fully markup-driven directive to abstract
Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) component.

**Example**:
```html
<dropdown as-id="'myDropdown'">
    <dropdown-item as-href="'http://google.com'">Google</dropdown-item>
    <dropdown-item as-href="'http://twitter.com'">Twitter</dropdown-item>
</dropdown>
```

_Note that you can still pass the usual ```dropdown-menu-right``` class to right-align the dropdown relatively to its parent_
