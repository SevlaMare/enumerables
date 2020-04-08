# Enumerable Methods
> Project to re-build a few methods of Ruby Language.

![screenshot](./images/screenshot.png)

<br>Methods based on Enumerable module and Array class.<br>
As described on documentation here [Enumerable](https://ruby-doc.org/core-2.7.0/Enumerable.html)
and [Array](https://ruby-doc.org/core-2.4.1/Array.html#method-i-each)
<br>[Inject](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/trunk/enum.c?view=markup&pathrev=54162)


## Content

* [Requirements](#requirements)
* [Built With](#built-with)
* [Live Demo](#live-demo)
* [Quick Start](#quick-start)
* [Dependencies](#dependencies)
* [Contributing](#contributing)
* [Acknowledgments](#acknowledgments)
* [Author](#author)
* [License](#license)


## Requirements

<ul>
  <h3>Features</h3>
  <p>Re-make these methods and match with documentation expected behavior</p>
  <li>.each (Only one from Array)</li>
  <li>.each_with_index</li>
  <li>.select (Filter like)</li>
  <li>.all?</li>
  <li>.any?</li>
  <li>.none?</li>
  <li>.count</li>
  <li>.map</li>
  <li>.inject (Reduce like)</li>
</ul>

<ul>
  <h3>Additional features</h3>
  <li>Create .multiply_els to test .inject</li>
  <p>Should multiply all the elements of array together</p>
  <li>Extends .map to accept procs</li>
</ul>

### Built With

- Ruby Language <br>
- Rubocop (Linter) with Stickler (CI Tool)<br>
- Git, Github and VScode <br>

## Live Demo

[Run on Repl.it](https://repl.it/@ThiagoMiranda2/enumerables)

## Quick Start

To get a local copy use:<br>
```js
git clone git@github.com:SevlaMare/enumerables.git
```

### Dependencies

Ruby 2.5.5
RSpec 3.9

```js
gem install rspec
```

#### Test Suit Setup
The test suit is:<br>
spec/main_spec.rb
<br>

The file tested is:<br>
main.rb
<br>

To run the suit on terminal type:
```js
rspec --format documentation
```


### Contributing

Contributions, issues and feature requests are welcome!

You can do it on [issues page](issues/).

## Acknowledgments

A special thanks for the code reviewers.

## Author

👤 **Thiago Miranda**

- Github: [@SevlaMare](https://github.com/SevlaMare)
- Twitter: [#SevlaMare)](https://twitter.com/SevlaMare)
- Linkedin: [SevlaMare)](https://www.linkedin.com/in/sevlamare)

### License

<strong>Creative Commons</strong>