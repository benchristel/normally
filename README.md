# Normally

## Prioritizing the Happy Path

Much of the time when talking about conditional expressions, the concepts of a _happy path_ and a _sad path_ are useful. The happy path is the branch of the conditional that executes during the normal operation of your program. The sad path is there only to deal with errors or invalid input. When test-driving code, I normally focus on the happy path first. When reading code, I like to see the happy path first because the happy path tells me what the code is supposed to do, while the sad path just tells me how the code avoids doing things it's not supposed to do.

Despite the importance of the happy path, the sad path is often the most visible in code with conditionals. Consider the following:

```ruby
def response_data(response)
  if response.success?
    JSON.parse(response.body)
  else
    nil
  end
end
```

The first thing we see when we look at this method is not the happy path, but the conditional that separates the normal case from the unexpected case. You have to read and understand this conditional before you can even tell which of its branches is the normal case.

What we'd really like is something like this:

```ruby
def response_data(response)
  normally { JSON.parse(response.body) }
    .but_if (response.error?) { nil }
end
```

Now the happy path is front and center. As you may have guessed, the `normally` gem makes this code actually work.

## Installation

You know the drill. If you're using [bundler](https://rubygems.org/gems/bundler), add this to your `Gemfile`:

```ruby
gem 'normally'
```

To install globally, do `gem install normally`

The `normally` method is part of the `Normally` module, which must be included either in the global namespace or in the class where you want to use the `normally` syntax. For example:

```ruby
class Foo
  include Normally

  def do_something
    normally { 'foo' }.but_if(error?) { 'fubar' }
  end
end
```
