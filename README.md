<a id="header-adp-github-headertag731"></a>
# Add Documentation\, Please\.\.\. with Github Flavoured Markdown

Welcome to ADP\-GITHUB\!

``` ADP-GITHUB ``` is an extension for ``` ADP ```\. It exports some functions and macros to print markdown\-styled objects like headers\, lists\, code blocks and more\. It also supports cross references and table of contents\. Every symbol is exported from the ``` adp-github ``` package\, although you can use the nickname ``` adpgh ```\.

* [Add Documentation\, Please\.\.\. with Github Flavoured Markdown](/README.md#header-adp-github-headertag731)
  * [Documentation](/README.md#header-adp-github-headertag732)
  * [How to use](/README.md#header-adp-github-headertag733)
  * [Where the files are generated](/README.md#header-adp-github-headertag734)


<a id="header-adp-github-headertag732"></a>
## Documentation

* [Reference](/docs/scribble/reference.md#header-adp-github-reference)
* [User Guide](/docs/scribble/user-guide.md#header-adp-github-user-guide)


<a id="header-adp-github-headertag733"></a>
## How to use

In your ``` asd ``` file\, you need to ``` :defsystem-depends-on ``` the system ``` adp-github ```\. Also\, is really recommended to make a separate system only for documentation generation\. And\, lastly\, you should specify ``` :build-operation ``` to be ``` "adp-github-op" ```\.

`````common-lisp
(defsystem "my-system"
  ;; ...
  )

(defsystem "my-system/docs"
  :defsystem-depends-on ("adp-github")
  :build-operation "adp-github-op"
  :depends-on ("my-system")
  :components ((:scribble "README")))
`````

Now\, from the REPL\, just evaluate the following expression\:

`````common-lisp
(asdf:make "my-system/docs")
`````

<a id="header-adp-github-headertag734"></a>
## Where the files are generated

There is a simple rule and one expception\. The rule says that every file is generated in a mirrored place under the ``` docs ``` directory\. For example\, the contents of file ``` src/myfile.scrbl ``` are printed into the file ``` docs/src/myfile.md ```\.

The exception is the file ``` README.scrbl ```\. If that file is placed at the root directory\, then the output is placed in the same place\.
