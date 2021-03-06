Glyphicons
----------
Shortcut directives for Bootstrap's glyphicons.

_For the list of all available icons, see http://getbootstrap.com/components/#glyphicons-glyphs_


###Simple glyph icon (span) `<glyph>`
#####Attributes:
  - `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).<br/>
  _See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list._
  
#####Example:
```html
<!-- Heart icon -->
<glyph icon="heart"></glyph>
```
&nbsp;

###Button glyphicon `<btn-glyph>`
#####Attributes:
  - `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
  _See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list._

  - `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet if you want using the `btn-` prefix)_:
   * `primary`
   * `success`
   * `info`
   * `warning`
   * `danger`<br/>

  _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `.btn-default` class_

  - `size`: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
   Possible choices are:
     * `lg`
     * `sm`
     * `xs`

#####Example:
```html
<!-- A large orange button with a heart in it -->
<btn-glyph icon="heart" theme="warning" size="lg"></glyph>
```


&nbsp;

-------------

&nbsp;


Dropdown `<dropdown>`
---------
A single directive to abstract all of 
Bootstrap's [dropdown](http://getbootstrap.com/components/#dropdowns) components.
> One Directive to rule them all,<br/>
> One Directive to find them,<br/>
> One Directive to bring them all and in the darkness 2-way data-bind them,<br/>
> In the Land of Mordor where the Shadow-DOM lie

&nbsp;

####Examples:
    

#####Single-button dropdown
```html
<dropdown as-type="btn" theme="danger" size="lg" icon="heart" title="Dropdown">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</dropdown>

<!-- Drop up -->
<dropdown as-type="btn" theme="success" size="sm" icon="qrcode"  dropup="true" title="Dropup">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</dropdown>
```

&nbsp;

#####Split-button dropdown
```html
<dropdown as-type="split" theme="danger" size="lg" icon="heart" title="Sign-In">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</dropdown>

<!-- Drop up -->
<dropdown as-type="split" theme="info" size="xs" icon="qrcode" title="Sign-In" dropup="true">
    <dropdown-item as-href="http://google.com">Google</dropdown-item>
    <dropdown-item as-href="http://twitter.com">Twitter</dropdown-item>
</dropdown>
```

&nbsp;

####Attributes:
  * `as-type`: the type of the dropdown. can be either `btn` or `split`
   &nbsp;

  * `theme`: the variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`

  * `icon`: the variable part of the Bootstrap 3.x glyphicons classes (i.e without the 'glyphicon-' prefix).
    See [here](http://getbootstrap.com/components/#glyphicons-glyphs) for the full list.

  * `size`: the variable part of the Bootstrap 3.x buttons size classes (i.e without the 'btn-' prefix).
    Possible choice are:
      * `lg`
      * `sm`
      * `xs`

  * `title`: The string to display inside the action button of the split dropdown

  * `dropup`: (_Boolean_) If set to true, the dropdown will effectively drop _up_ and the caret direction will be inverted.
  If set to false or not specified, the element will drop _down_

&nbsp;

=======

&nbsp;

###List Item `<list-item>`
This is the `<list-item>` directive used through transclusion by the dropdown & navbar directives.
<br/>

#####Attributes:
  - `asHref`: the url this dropdown-item should point to
_Note that you can still pass the usual `.disabled` class to disable an item
<br/>

&nbsp;

=======

&nbsp;

###List Divider `<list-divider>`
The `<list-divider>` directive used through transclusion by the dropdown & navbar directives

&nbsp;

-------------

&nbsp;

Navigation Bar  
==============

Bootstrap's navigation bar in just 1 line of markup (without the content).
<br/> 

####Example:
```html
<navbar as-id="navbar" fixed="top" title="Angustrap" title-href="#">
    <navbar-list side="right">
        <list-item as-href="#">Item 1</list-item>
        <list-item as-href="#">Item 2</list-item>
        <list-item as-href="#">Item 3</list-item>
        <navbar-dropdown title="Sign-In">
            <list-item as-href="#">Dropdown item 1</list-item>
            <list-item as-href="#">Dropdown item 2</list-item>
        </navbar-dropdown>
    </navbar-list>
</navbar>
```

Navbar `<navbar>`
-----------------

#### Attributes:
 * `theme`: Can be either `default` or `inverse`. If none is specified, Angustrap will fallback to `default`.
 
 * `title`: The navigation bar title, usually your brand name.
 
 * `titleHref`: The URL the navbar `title` link should point to.

 * `fixed`: Whether the navbar should be fixed to the `top` or `bottom` of the page.
    If this attribute is not specified or set to `static`, the navbar will be at the top of the screen and scroll with the content (`.navbar-static-top`).
 
 * `center`: Whether the navbar content & title should be centered (i.e: inside a `div.container`)
 
 <br/>
 
NavbarList `<navbar-list>`
-----------------

#### Attributes:
* `side`: Whether the list should be aligned to the `left` or to the `right` inside its `<navbar>` parent.

<br/>
 
NavbarDropdown `<navbar-dropdown>`
-----------------

#### Attributes:
* `title`: The title of the dropdown list item. Has the same appearance as a `<list-item>`

&nbsp;

-------------

&nbsp;

Input Groups
============

InputGroup `<input-group>`
--------------------------
A single directive to abstract all of Bootstrap's input-group components.

####Examples:
```html
<!-- Left-aligned large <span> add-on with text input -->
<input-group title="@" as-type="span" size="lg" side="left" type="text"></input-group>

<!-- Right-aligned blue <button> add-on with email input -->
<input-group title="@" as-type="btn" side="right" type="email" theme="primary"></input-group>
```

&nbsp;

####Attributes:
* `title`: The text to display inside of the input add-on (span, button... depending on the `type` attribute)

* `as-type`: The type of the add-on. Can be on of the following:
  * `span`: Will result in a `<span>` add-on
  * `btn`: Will result in a `<button>` add-on

* `type`: The HTML5 `type` attribute of the `<input>` ("text", "tel", "number", "email", etc...)

* `side`: Whether the add-on should be on the `left` or on the `right` of the `<input>`

* `size`: Defines the size of the input-group. Accepted values are:
  * `lg`
  * `sm`
  If none is specified, the medium size will be used.

* `theme`: _Only valid for button input-groups (`<input-group type="btn">`)._<br/>
    The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`

    _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `.btn-default` class_


Panels
============

Panel `<panel>`
--------------------------
A directive to abstract Bootstrap's panel component.

####Examples:
```html
<!-- Default panel -->
<panel title="My Panel">
    ...
</panel>

<!-- Themed panel -->
<panel title="My Panel" theme="primary">
    ...
</panel>

<!-- Panel with footer -->
<panel title="My Panel" theme="primary" footer>
    ...
</panel>
```

&nbsp;

####Attributes:
* `title`: The text to display inside of the input add-on (span, button... depending on the `type` attribute)

* `theme`: The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`

    _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `default` theme_

* `footer`: _(Boolean)_ Whether the panel title should be placed at the bottom of the panel or not

&nbsp;

Alerts
============

Alert `<alert>`
--------------------------
A directive to abstract Bootstrap's alert component.

####Examples:
```html
<!-- Red alert -->
<alert theme="danger">Something ain't right!</alert>

<!-- Green alert -->
<alert theme="success">Props! You did it!</alert>

<!-- Dismissible blue alert -->
<alert theme="info" dismissible>Props! You did it!</alert>
```

&nbsp;

####Attributes:
* `theme`: The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`

* `dismissible`: Whether the alert should be dismissible via a close button at its top-right corner

  _**Note:** when using links inside an `<alert>`, remember to use the `.alert-link` class to provide matching colors on the link. ([example](http://getbootstrap.com/components/#alerts-links))_

&nbsp;

Progress Bars
============

ProgressBar `<progress-bar>`
--------------------------
A directive to abstract Bootstrap's progress bar component.

####Examples:
```html
<!-- Green Progress Bar -->
<progress-bar theme="success" current="95"></progress-bar>

<!-- Red Progress Bar with label -->
<progress-bar theme="danger" title="Angustrap" current="75"></progress-bar>

<!-- Orange Striped Progress Bar with label -->
<progress-bar theme="warning" current="75" striped></progress-bar>

<!-- Blue Animated Progress Bar with label -->
<progress-bar theme="warning" title="Angustrap" current="75" striped animated></progress-bar>
```

&nbsp;

####Attributes:
* `theme`: The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`

    _**Note**: If no `theme` attribute is specified, Angustrap will default-back to Bootstrap's `default` theme_

* `current`: _(Integer)_ the current progress percentage

* `title`: _(String)_ the label to display inside the progressbar (optional)

* `striped`: _(Boolean)_ whether the progress-bar should be striped or not

* `animated`: _(Boolean)_ if the progress bar is `striped`, defined whether the progress-bar stripes should be animated

&nbsp;

Labels
============

AsLabel `<as-label>`
--------------------------
A shortcut directive for Bootstrap's label component.

####Examples:
```html
<!-- Default label -->
<as-label>My Label</as-label>

<!-- Green label -->
<as-label theme="success">Success Label</as-label>

<!-- Blue label -->
<as-label theme="info">Info Label</as-label>
```

&nbsp;

####Attributes:
* `theme`: The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`

&nbsp;

Wells
============

Well `<well>`
--------------------------
A shortcut directive for Bootstrap's well component.

####Examples:
```html
<!-- Large well -->
<well size="lg">Large Well</as-label>

<!-- Default well -->
<well>Default Well</well>

<!-- Small well -->
<well size="sm">Small Well</well>
```

&nbsp;

####Attributes:
* `theme`: The variable part of the Bootstrap 3.x buttons theme classes (i.e without the 'btn-' prefix).<br/>
    The stock ones are as follows _(but you can create your own in your stylesheet using the `btn-` prefix)_:
    * `primary`
    * `success`
    * `info`
    * `warning`
    * `danger`