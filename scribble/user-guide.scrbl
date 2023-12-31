
(in-package #:adpgh)


@header[:tag user-guide]{User Guide}

Welcome to the ADP-GITHUB User Guide! I will try to do my best explaining how to use ADP-GITHUB. If this is not sufficient, note that every piece of documentation of ADP-GITHUB has been generated by itself. So you can see the source code and see how ADP-GITHUB has been used. For example, this file was generated using the source located at @code{scribble/user-guide.scrbl} .

@mini-table-of-contents[]

@subheader{Headers}

You can add headers in your documentation. In other words, they work as titles or subtitles. You can this way organize your guide with different sections (like I do in this guide). The macros that add headers are @fref[header], @fref[subheader] and @fref[subsubheader]. They need a string as the first argument. For example, if I write this:

@code-block[:lang "common-lisp"]|{
@header{This is a header}
@subheader{This is a subheader}
@subsubheader{This is a subsubheader}
}|

You will see this:

@header{This is a header}
@subheader{This is a subheader}
@subsubheader{This is a subsubheader}

@subheader{Tables}

You can add tables using the macros @fref[table], @fref[row] and @fref[cell]. The best way to see how to use it is an example. Imagine we have some info in our lisp files:

@code-block{
  (cl:defparameter peter-info '(34 "Peter Garcia" 1435))
  (cl:defparameter maria-info '(27 "Maria Martinez" 1765))
  (cl:defparameter laura-info '(53 "Laura Beneyto" 1543))

  (cl:defun get-age (info)
    (first info))

  (cl:defun get-name (info)
    (second info))

  (cl:defun get-salary (info)
    (third info))
}

Now we can create a table like this:

@code-block[:lang "common-lisp"]|{
@table[
  @row[
    @cell{Age} @cell{Name} @cell{Salary}
  ]
  @row[
    @cell[(get-age peter-info)] @cell[(get-name peter-info)] @cell[(get-salary peter-info)]{€}
  ]
  @row[
    @cell[(get-age maria-info)] @cell[(get-name maria-info)] @cell[(get-salary maria-info)]{€}
  ]
  @row[
    @cell[(get-age laura-info)] @cell[(get-name laura-info)] @cell[(get-salary laura-info)]{€}
  ]
]
}|

And you will see this:

@table[
  @row[
    @cell{Age} @cell{Name} @cell{Salary}
  ]
  @row[
    @cell[34] @cell["Peter Garcia"] @cell[1435]{€}
  ]
  @row[
    @cell[27] @cell["Maria Martinez"] @cell[1765]{€}
  ]
  @row[
    @cell[53] @cell["Laura Beneyto"] @cell[1543]{€}
  ]
]

@subheader{Lists}

You can add lists with @fref[itemize] or @fref[enumerate]. For example:

@code-block[:lang "common-lisp"]|{
@itemize[
  @item{Vegetables:}
  @enumerate[
    @item{3 peppers}
    @itemize[
      @item{1 green pepper}
      @item{@(- 3 1) red pepper}
    ]
    @item{0.25 Kg of carrots}
  ]
  @item{Fruits:}
  @enumerate[
    @item{0.5 Kg of apples}
    @item{6 oranges}
  ]
]
}|

You will see this:

@itemize[
  @item{Vegetables:}
  @enumerate[
    @item{3 peppers}
    @itemize[
      @item{1 green pepper}
      @item{@(- 3 1) red pepper}
    ]
    @item{0.25 Kg of carrots}
  ]
  @item{Fruits:}
  @enumerate[
    @item{0.5 Kg of apples}
    @item{6 oranges}
  ]
]

@subheader{Text style}

We can enrich the text with the macros @fref[bold], @fref[italic], @fref[emphasis] and @fref[link]. For example:

@code-block[:lang "text"]|{
As @bold{Andrew} said: @italic{You only need @(+ 1 2 3)} @link[:address "https://en.wikipedia.org/wiki/Coin"]{coins} @italic{to enter in} @emphasis{The Giant Red Tree}.
}|

You will see this:

As @bold{Andrew} said: @italic{You only need @(+ 1 2 3)} @link[:address "https://en.wikipedia.org/wiki/Coin"]{coins} @italic{to enter in} @emphasis{The Giant Red Tree}.

You can nest @fref[bold] and @fref[italic] functions:

@code-block[:lang "text"]|{
The large @bold{house with @italic{the old woman}}.
}|

The large @bold{house with @italic{the old woman}}.

Lastly, you can quote text:

@code-block[:lang "text"]|{
@quoted{
A driller by day
A driller by night
Bugs never hurt
As they're frozen from fright

My c4 goes boom
Sharp as a ruler
Just me and my baby
@italic{Perfectly Tuned Cooler}

- A Deep Rock Galactic poem by @link[:address "https://www.reddit.com/user/TEAdown/"]{TEAdown}
}
}|

@quoted{
A driller by day
A driller by night
Bugs never hurt
As they're frozen from fright

My c4 goes boom
Sharp as a ruler
Just me and my baby
@italic{Perfectly Tuned Cooler}

- A Deep Rock Galactic poem by @link[:address "https://www.reddit.com/user/TEAdown/"]{TEAdown}
}


@subheader{Images}

You can add images with the macro @fref[image]. For example, an image is located at @code{guides/images/}. If I evaluate the next expression:

@code-block[:lang "text"]|{
  @image[#P"images/Lisp_logo.svg" :alt-text "Lisp logo" :scale 0.1]
}|

You will see:

@image[#P"images/Lisp_logo.svg" :alt-text "Lisp logo" :scale 0.1]


@subheader{Code blocks}

A good Lisp tutorial must include Lisp code examples. ADP defines some macros to print code blocks: @fref[code-block] and @fref[example]. The first macro does not evaluate the code. So, for example if you write this:

@code-block[:lang "text"]|{
  @code-block{
    (this is not (valid code))
    (but it (is (ok)))
  }
}|

You will see:

@code-block{
  (this is not (valid code))
  (but it (is (ok)))
}

The macro @fref[code-block] allows you to write non-Lisp code as well. It can receive, optionally, the language to be used:

@code-block[:lang "text"]|{
@code-block[:lang "c"]{
  int main(){
    printf("Hello world!");
    return 0;
  }     
}
}|

@code-block[:lang "c"]{
  int main(){
    printf("Hello world!");
    return 0;
  }     
}

If you want to print also @"@"-syntax expressions, you can use the @code["|{...}|"] form:

@code-block[:lang "text"]|{
@code-block[:lang "scribble"]|{
  @cmd[datum]{parse-body}     
}|
}|

@code-block[:lang "scribble"]|{
  @cmd[datum]{parse-body}     
}|

Lastly, @fref[example] evaluate the Lisp code you write on it. And what is more, it prints the standard output as well as the returned values. For example, writing this:

@code-block[:lang "text"]|{
@example{
  (loop for i from 0 below 10
        do (print i))
  (values "Hello" "world")
}
}|

You will see:

@example{
  (loop for i from 0 below 10
        do (print i))
  (values "Hello" "world")
}

See that we used the @code["{}"] form. I. e., we are writing text. It will be read and then evaluated. We can also use the @code["|{}|"] form to make scribble code to be printed:

@code-block[:lang "text"]|{
@example|{
  (print @+[3 4])
}|
}|

@example|{
  (print @+[3 4])
}|


@subheader{Descriptions and cross references}

If we need to document our code, we may want to generate a refernce page where all the functions, variables or classes are described properly. Also, a good system to make a link to a description would be really nice.

ADP-GITHUB creates references from description. Each time you create a description, a reference can be created to refer to that description. There are five types of descriptions: @code{functions}, @code{variables}, @code{classes}, @code{packages} and @code{systems}. And each type of description can be referenced by a reference of the same type.


@subsubheader{Descriptions}

Description can be inserted with the functions @fref[function-description], @fref[variable-description], @fref[class-description], @fref[package-description] and @fref[system-description].

For example, ADP-GITHUB defines the function @fref[image] we've seen before. I we want a description of that function we need to write the following:

@code-block[:lang "common-lisp"]|{
@function-description[image]
}|

And we see this:

@function-description[image]

The same goes for the rest of functions. For example, we can see the description of the system @code{adp-github}.

@code-block[:lang "common-lisp"]|{
@system-description["adp-github"]
}|

@system-description["adp-github"]


@subsubheader{References}

We can differentiate between header references and description references. As you can guess, header references will reference to a header, subheader or subsubheader. On the other hand, descriptions references will reference to a description.

The functions that inserts references are @fref[href], @fref[fref], @fref[vref], @fref[cref], @fref[pref] and @fref[sref]. They insert a reference to a header, function, variable, class, package and system respectively.

The @fref[href] function is a bit different from the others. It accepts a variable number of arguments, and it should receive a keyword argument @code{:tag}.

@code-block[:lang "common-lisp"]|{
@href[:tag user-guide]{A link to the top.}
}|

@href[:tag user-guide]{A link to the top.}

As you can see, the rest of elements received are used to indicate the text of the inserted link. The rest of reference functions only receive one argument.

Above we've inserted a system description. We can now create a reference to that description:

@code-block[:lang "common-lisp"]|{
@sref["adp-github"]
}|

And we will see:

@sref["adp-github"]

The same goes to the rest of types. However, there is one more thing we should know. If I use the following:

@code-block[:lang "common-lisp"]|{
@fref[image]
}|

@fref[image]

you will see that the link goes to the reference page and not to the description we wrote above. That's because glossaries (that we will explain in the following section) have precedence over single descriptions. 


@subheader{Glossaries}

A system may export a ton of symbols, maybe hundreds. For that reason we need some way to insert descriptions automatically. That is the job of glossaries. We have glossaries of three types: @code{functions}, @code{variables} and @code{classes}. They can be inserted with the functions @fref[function-glossary], @fref[variable-glossary] and @fref[class-glossary].

Each type of glossary will iterate over all the exported symbols looking for possible descriptions to insert. For example. the @fref[variable-glossary] will look for exported symbols that has a value associated with it. 

The best example I can show here is the @href[:tag reference]{reference page} of this project. The complete source code of the reference page is the following:

@code-block[:lang "scribble"]|{
(in-package #:adpgh)

@header[:tag reference]{Reference}

@function-glossary[#:adpgh]
}|

@subheader{End of the guide}

I hope I explained everything well. That's all ADP-GITHUB can offer to you.

:D
