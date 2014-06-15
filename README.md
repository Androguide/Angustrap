Glyphicons
----------
Shortcut directives for Bootstrap's glyphicons.<br/><br/>
**Examples**:<br/>
```html
<glyph icon="heart"></glyph>
<glyph icon="qrcode">Sign-In</glyph>
<btn-glyph icon="heart-empty">Angustrap</glyph>
```
<br/>
_For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_

###Simple glyph icon (span)
**Attributes**:
  - icon: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).<br/>
  _See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list._

###Button glyphicon
**Attributes**:
  - `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
  _See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list._

  - `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
  The stock ones are as follows, but you can create your own in your stylesheet if you want:
    * _primary_
    * _success_
    * _info_
    * _warning_
    * _danger_

    _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `.btn-default` class_

  - `size`: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
    Possible choices are:
      * _lg_
      * _sm_
      * _xs_

Dropdowns
---------
Fully markup-driven directives to abstract
Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.<br/><br/>
_Note that you can still pass the usual `.dropdown-menu-right` class to right-align the dropdown relatively to its parent_

###Dropdown Item
This is the `<dropdown-item>` directive used through transclusion by the other dropdown directives.
<br/>
**Attributes**:
  - `asHref`: the url this dropdown-item should point to
_Note that you can still pass the usual `.disabled` class to disable an item

###Dropdown Divider
The `<dropdown-divider>` directive used through transclusion by the other dropdown directives

###Regular Dropdown
**Example**:<br/>
```html
<dropdown as-id="myDropdown">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</dropdown>
```

###Single-button dropdown
**Example**:<br/>
```html
<btn-dropdown theme="danger" size="lg" title="Sign-In">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</btn-dropdown>
```

##Split-button dropdown
####Attributes:
  * theme
  * icon
  * size
  * title

<br/>**Example**:<br/>
```html
<split-dropdown theme="danger" size="lg" icon="qrcode" title="Sign-In">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</btn-dropdown>
```
