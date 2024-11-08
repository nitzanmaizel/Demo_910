#!/bin/bash
# Ensure frontend config directory exists
mkdir -p frontend/src

# Create index.css file with content
cat <<EOL > frontend/src/index.css
html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
menu,
nav,
section {
  display: block;
}
body {
  line-height: 1;
}
ol,
ul {
  list-style: none;
}
blockquote,
q {
  quotes: none;
}
blockquote:before,
blockquote:after,
q:before,
q:after {
  content: '';
  content: none;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}

/* Base Typography */
body {
  font-family: 'Arial', sans-serif;
  line-height: 1.6;
  color: #333;
  background-color: #f4f4f4;
  min-height: 100vh;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  color: #444;
  margin-bottom: 10px;
  line-height: 1.2;
}

/* Links */
a {
  color: #3498db;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* Forms */
form {
  min-width: 100%;
  margin: 0 auto;
  background: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

label {
  font-weight: bold;
  margin-bottom: 5px;
  display: block;
}

input[type='text'] {
  text-align: right;
}

/* Layout */
.container {
  max-width: 960px;
  margin: 0 auto;
  min-height: calc(100vh - 105px - 50px);
}

ul {
  margin-top: 20px;
}

ul li {
  padding: 10px;
  background: #fff;
  margin-bottom: 10px;
  border-radius: 3px;
}
EOL