return {
    image = "{{image}}",
<* for name, value in colors *>
    {{name}} = "{{value.default.rgba}}",
<* endfor *>
}
