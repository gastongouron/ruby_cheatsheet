# Ruby Interview Cheatsheet

## 1. Méthodes les plus utiles (~50)

### Enumerable / Array

| Méthode | Usage | Exemple |
|---------|-------|---------|
| `each` | Itérer sans transformer | `[1,2,3].each { |n| puts n }` |
| `map` / `collect` | Transformer chaque élément | `[1,2,3].map { |n| n * 2 }  # => [2,4,6]` |
| `select` / `filter` | Garder les éléments qui matchent | `[1,2,3,4].select(&:even?)  # => [2,4]` |
| `reject` | Inverse de select | `[1,2,3,4].reject(&:even?)  # => [1,3]` |
| `find` / `detect` | Premier élément qui matche | `[1,2,3].find { |n| n > 1 }  # => 2` |
| `find_all` | Tous les éléments qui matchent | `[1,2,3,4].find_all(&:odd?)  # => [1,3]` |
| `reduce` / `inject` | Accumuler une valeur | `[1,2,3].reduce(0) { |sum, n| sum + n }  # => 6` |
| `each_with_index` | Itérer avec index | `%w[a b].each_with_index { |v, i| puts "#{i}: #{v}" }` |
| `each_with_object` | Itérer en construisant un objet | `[1,2].each_with_object({}) { |n, h| h[n] = n*2 }` |
| `group_by` | Grouper par critère | `%w[foo bar baz].group_by(&:length)  # => {3=>["foo","bar","baz"]}` |
| `partition` | Séparer en 2 arrays | `[1,2,3,4].partition(&:even?)  # => [[2,4], [1,3]]` |
| `sort` | Trier | `[3,1,2].sort  # => [1,2,3]` |
| `sort_by` | Trier par critère | `%w[foo ab].sort_by(&:length)  # => ["ab", "foo"]` |
| `min` / `max` | Valeur min/max | `[3,1,2].max  # => 3` |
| `minmax` | Les deux d'un coup | `[3,1,2].minmax  # => [1, 3]` |
| `min_by` / `max_by` | Min/max par critère | `%w[foo ab].max_by(&:length)  # => "foo"` |
| `first` / `last` | Premier/dernier élément(s) | `[1,2,3].first(2)  # => [1,2]` |
| `take` / `drop` | Prendre/ignorer n éléments | `[1,2,3,4].take(2)  # => [1,2]` |
| `take_while` / `drop_while` | Prendre/ignorer tant que condition | `[1,2,3,1].take_while { |n| n < 3 }  # => [1,2]` |
| `count` | Compter (optionnel: par critère) | `[1,2,2,3].count(2)  # => 2` |
| `sum` | Sommer | `[1,2,3].sum  # => 6` |
| `uniq` | Dédupliquer | `[1,1,2].uniq  # => [1,2]` |
| `compact` | Retirer les nil | `[1, nil, 2].compact  # => [1,2]` |
| `flatten` | Aplatir les arrays imbriqués | `[[1,2], [3]].flatten  # => [1,2,3]` |
| `zip` | Combiner des arrays | `[1,2].zip([3,4])  # => [[1,3], [2,4]]` |
| `transpose` | Transposer matrice | `[[1,2], [3,4]].transpose  # => [[1,3], [2,4]]` |
| `reverse` | Inverser | `[1,2,3].reverse  # => [3,2,1]` |
| `rotate` | Rotation | `[1,2,3].rotate  # => [2,3,1]` |
| `sample` | Élément(s) aléatoire(s) | `[1,2,3].sample(2)  # => [3,1]` |
| `shuffle` | Mélanger | `[1,2,3].shuffle  # => [2,3,1]` |
| `include?` | Contient? | `[1,2,3].include?(2)  # => true` |
| `any?` / `all?` / `none?` | Prédicats | `[1,2,3].any?(&:even?)  # => true` |
| `one?` | Exactement un matche | `[1,2,3].one?(&:even?)  # => true` |
| `empty?` | Vide? | `[].empty?  # => true` |
| `size` / `length` | Taille | `[1,2,3].size  # => 3` |
| `push` / `<<` | Ajouter à la fin | `[1,2] << 3  # => [1,2,3]` |
| `pop` / `shift` | Retirer fin/début | `[1,2,3].pop  # => 3` |
| `unshift` | Ajouter au début | `[2,3].unshift(1)  # => [1,2,3]` |
| `insert` | Insérer à position | `[1,3].insert(1, 2)  # => [1,2,3]` |
| `delete` / `delete_at` | Supprimer valeur/index | `[1,2,3].delete(2)  # => 2, array: [1,3]` |
| `slice` / `[]` | Extraire portion | `[1,2,3,4][1,2]  # => [2,3]` |
| `&` / `|` / `-` | Intersection/union/diff | `[1,2] & [2,3]  # => [2]` |
| `product` | Produit cartésien | `[1,2].product([3,4])  # => [[1,3],[1,4],[2,3],[2,4]]` |
| `tally` | Compter occurrences | `%w[a b a].tally  # => {"a"=>2, "b"=>1}` |

### Hash

| Méthode | Usage | Exemple |
|---------|-------|---------|
| `keys` / `values` | Clés/valeurs | `{a: 1, b: 2}.keys  # => [:a, :b]` |
| `fetch` | Get avec default/erreur | `{a: 1}.fetch(:b, 0)  # => 0` |
| `dig` | Accès nested safe | `{a: {b: 1}}.dig(:a, :b)  # => 1` |
| `merge` | Fusionner | `{a: 1}.merge(b: 2)  # => {a: 1, b: 2}` |
| `transform_keys` | Transformer les clés | `{a: 1}.transform_keys(&:to_s)  # => {"a"=>1}` |
| `transform_values` | Transformer les valeurs | `{a: 1}.transform_values { |v| v * 2 }  # => {a: 2}` |
| `slice` | Sous-hash par clés | `{a: 1, b: 2, c: 3}.slice(:a, :c)  # => {a: 1, c: 3}` |
| `except` (Rails) | Hash sans certaines clés | `{a: 1, b: 2}.except(:b)  # => {a: 1}` |
| `invert` | Inverser clés/valeurs | `{a: 1, b: 2}.invert  # => {1=>:a, 2=>:b}` |
| `to_a` | Convertir en array | `{a: 1}.to_a  # => [[:a, 1]]` |
| `has_key?` / `key?` | Clé existe? | `{a: 1}.key?(:a)  # => true` |
| `has_value?` / `value?` | Valeur existe? | `{a: 1}.value?(1)  # => true` |
| `default` / `default=` | Valeur par défaut | `h = Hash.new(0); h[:x] += 1  # => 1` |
| `compact` | Retirer paires nil | `{a: 1, b: nil}.compact  # => {a: 1}` |

### String

| Méthode | Usage | Exemple |
|---------|-------|---------|
| `split` | Découper | `"a,b,c".split(",")  # => ["a","b","c"]` |
| `join` | Joindre (sur Array) | `["a","b"].join("-")  # => "a-b"` |
| `strip` / `chomp` | Retirer whitespace/newline | `"  hello  ".strip  # => "hello"` |
| `upcase` / `downcase` | Casse | `"Hello".downcase  # => "hello"` |
| `capitalize` / `titleize` | Capitaliser | `"hello world".capitalize  # => "Hello world"` |
| `gsub` / `sub` | Remplacer (all/first) | `"hello".gsub("l", "L")  # => "heLLo"` |
| `match` / `match?` | Regex | `"hello".match?(/ell/)  # => true` |
| `scan` | Tous les matches | `"ab12cd34".scan(/\d+/)  # => ["12", "34"]` |
| `start_with?` / `end_with?` | Commence/finit par | `"hello".start_with?("he")  # => true` |
| `include?` | Contient? | `"hello".include?("ell")  # => true` |
| `index` / `rindex` | Position (first/last) | `"hello".index("l")  # => 2` |
| `chars` / `bytes` | Array de chars/bytes | `"ab".chars  # => ["a", "b"]` |
| `lines` | Array de lignes | `"a\nb".lines  # => ["a\n", "b"]` |
| `reverse` | Inverser | `"hello".reverse  # => "olleh"` |
| `tr` | Translittération | `"hello".tr("el", "ip")  # => "hippo"` |
| `squeeze` | Réduire répétitions | `"aaabbb".squeeze  # => "ab"` |
| `center` / `ljust` / `rjust` | Padding | `"hi".center(6, "-")  # => "--hi--"` |
| `*` | Répéter | `"ab" * 3  # => "ababab"` |
| `%` | Format | `"Hello %s" % "world"  # => "Hello world"` |
| `to_sym` | Convertir en symbole | `"hello".to_sym  # => :hello` |
| `freeze` | Rendre immutable | `"hello".freeze` |

### Object / Kernel

| Méthode | Usage | Exemple |
|---------|-------|---------|
| `class` | Classe de l'objet | `"hello".class  # => String` |
| `is_a?` / `kind_of?` | Instance de? | `"hello".is_a?(String)  # => true` |
| `instance_of?` | Instance exacte de? | `"hello".instance_of?(String)  # => true` |
| `respond_to?` | Répond à méthode? | `"hello".respond_to?(:upcase)  # => true` |
| `send` / `public_send` | Appeler méthode dynamiquement | `"hello".send(:upcase)  # => "HELLO"` |
| `method` | Obtenir objet Method | `m = "hello".method(:upcase); m.call` |
| `tap` | Debug/chaînage | `[1,2].tap { |a| puts a }.map(&:to_s)` |
| `then` / `yield_self` | Transformer self | `2.then { |n| n * 3 }  # => 6` |
| `itself` | Retourner self | `[1,2,1].group_by(&:itself)  # => {1=>[1,1], 2=>[2]}` |
| `dup` / `clone` | Copier | `a = [1,2]; b = a.dup` |
| `freeze` / `frozen?` | Immutabilité | `"hi".freeze.frozen?  # => true` |
| `nil?` | Est nil? | `nil.nil?  # => true` |
| `!` / `!!` | Négation / coerce bool | `!!nil  # => false` |
| `==` / `eql?` / `equal?` | Égalité valeur/type/identité | `1 == 1.0  # true, 1.eql?(1.0)  # false` |
| `<=>` | Spaceship (comparaison) | `1 <=> 2  # => -1` |
| `hash` | Hash code | `"hello".hash  # => 123456...` |
| `inspect` / `to_s` | Représentation string | `[1,2].inspect  # => "[1, 2]"` |
| `pp` / `p` | Pretty print / debug | `pp({a: {b: 1}})` |
| `raise` / `fail` | Lever exception | `raise ArgumentError, "bad arg"` |
| `begin/rescue/ensure` | Gestion erreurs | `begin; risky; rescue => e; handle(e); end` |
| `loop` | Boucle infinie | `loop { break if done }` |
| `times` | Répéter n fois | `3.times { |i| puts i }` |
| `upto` / `downto` | Itérer range | `1.upto(3) { |n| puts n }` |
| `step` | Itérer avec pas | `1.step(10, 2) { |n| puts n }  # 1,3,5,7,9` |

---

## 2. Classes et Modules

### Définition de classe

```ruby
class Animal
  # Constante
  KINGDOM = "Animalia"
  
  # Variable de classe (partagée par toutes les instances et sous-classes)
  @@count = 0
  
  # Accesseurs (génèrent getter/setter)
  attr_reader :name          # getter seulement
  attr_writer :age           # setter seulement  
  attr_accessor :species     # getter + setter
  
  # Constructeur
  def initialize(name, species = "Unknown")
    @name = name             # Variable d'instance
    @species = species
    @@count += 1
  end
  
  # Méthode d'instance
  def speak
    "Some sound"
  end
  
  # Méthode de classe
  def self.count
    @@count
  end
  
  # Autre syntaxe méthode de classe
  class << self
    def reset_count
      @@count = 0
    end
  end
  
  # Méthode privée
  private
  
  def secret
    "shhh"
  end
  
  # Méthode protégée (accessible par même classe et sous-classes)
  protected
  
  def internal
    "internal"
  end
end
```

### Héritage

```ruby
class Dog < Animal
  def initialize(name, breed)
    super(name, "Canis familiaris")  # Appelle parent
    @breed = breed
  end
  
  # Override
  def speak
    "Woof!"
  end
  
  # Appeler la méthode parente
  def speak_with_intro
    "I'm #{@name}. " + super
  end
end

dog = Dog.new("Rex", "German Shepherd")
dog.speak  # => "Woof!"
Dog.count  # => 1
```

### Modules - Mixins

```ruby
module Swimmable
  def swim
    "#{self.class} is swimming"
  end
end

module Flyable
  def fly
    "#{self.class} is flying"
  end
end

class Duck < Animal
  include Swimmable  # Ajoute comme méthodes d'instance
  include Flyable
  
  def speak
    "Quack!"
  end
end

duck = Duck.new("Donald", "Anas")
duck.swim  # => "Duck is swimming"
duck.fly   # => "Duck is flying"
```

### Modules - Extend (méthodes de classe)

```ruby
module Findable
  def find_by_name(name)
    # logique...
  end
end

class User
  extend Findable  # Ajoute comme méthodes de classe
end

User.find_by_name("John")
```

### Modules - Prepend (priorité sur la classe)

```ruby
module Logging
  def speak
    puts "About to speak..."
    super  # Appelle la méthode de la classe
  end
end

class Cat < Animal
  prepend Logging  # Logging#speak sera appelé AVANT Cat#speak
  
  def speak
    "Meow!"
  end
end

Cat.new("Whiskers").speak
# Output: About to speak...
# => "Meow!"
```

### Module comme namespace

```ruby
module MyApp
  module Models
    class User
      # ...
    end
  end
  
  module Services
    class AuthService
      # ...
    end
  end
  
  # Constantes
  VERSION = "1.0.0"
end

user = MyApp::Models::User.new
MyApp::VERSION  # => "1.0.0"
```

### Callbacks avec included/extended

```ruby
module Trackable
  def self.included(base)
    puts "#{self} included in #{base}"
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def track(field)
      # Ajoute du tracking...
    end
  end
  
  def tracked_fields
    # Instance method
  end
end

class Order
  include Trackable  # Déclenche self.included
end
```

### Struct et OpenStruct

```ruby
# Struct - classe légère avec attributs
Person = Struct.new(:name, :age) do
  def adult?
    age >= 18
  end
end

person = Person.new("John", 25)
person.name   # => "John"
person.adult? # => true

# OpenStruct - attributs dynamiques
require 'ostruct'
config = OpenStruct.new(host: "localhost", port: 3000)
config.host      # => "localhost"
config.timeout = 30  # Ajout dynamique
```

### Data (Ruby 3.2+)

```ruby
# Immutable value object
Point = Data.define(:x, :y) do
  def distance_from_origin
    Math.sqrt(x**2 + y**2)
  end
end

p = Point.new(3, 4)
p.x  # => 3
p.distance_from_origin  # => 5.0
# p.x = 5  # Error! Immutable
```

### Method visibility recap

```ruby
class Example
  def public_method      # Accessible partout
  end
  
  private
  
  def private_method     # Accessible seulement dans la classe
  end
  
  protected
  
  def protected_method   # Accessible dans la classe et sous-classes
  end
end

# Syntaxe alternative (inline)
class Example2
  def foo; end
  def bar; end
  def baz; end
  
  private :bar
  protected :baz
end

# Définition privée inline (Ruby 2.1+)
class Example3
  private def secret
    "shhh"
  end
end
```

---

## 3. Opérateurs

### Opérateurs de base

| Opérateur | Nom | Exemple |
|-----------|-----|---------|
| `+` `-` `*` `/` | Arithmétique | `5 + 3  # => 8` |
| `%` | Modulo | `7 % 3  # => 1` |
| `**` | Puissance | `2 ** 3  # => 8` |
| `==` | Égalité valeur | `1 == 1.0  # => true` |
| `!=` | Différent | `1 != 2  # => true` |
| `<` `>` `<=` `>=` | Comparaison | `3 > 2  # => true` |
| `<=>` | Spaceship | `1 <=> 2  # => -1` (retourne -1, 0, ou 1) |
| `===` | Case equality | `(1..5) === 3  # => true` |
| `eql?` | Égalité type+valeur | `1.eql?(1.0)  # => false` |
| `equal?` | Même objet (identité) | `a.equal?(b)  # même object_id?` |

### Opérateurs logiques

| Opérateur | Nom | Exemple |
|-----------|-----|---------|
| `&&` / `and` | ET logique | `true && false  # => false` |
| `\|\|` / `or` | OU logique | `true \|\| false  # => true` |
| `!` / `not` | Négation | `!true  # => false` |
| `!!` | Double négation (coerce bool) | `!!"hello"  # => true` |

**Note:** `&&` / `||` ont priorité plus haute que `and` / `or`. Préférer `&&` / `||`.

### Opérateurs d'assignation

| Opérateur | Nom | Exemple |
|-----------|-----|---------|
| `=` | Assignation | `x = 5` |
| `+=` `-=` `*=` `/=` | Op + assign | `x += 1  # x = x + 1` |
| `\|\|=` | Assign si nil/false | `x \|\|= 5  # x = x \|\| 5` |
| `&&=` | Assign si truthy | `x &&= 5  # x = x && 5` |

### Splat `*` (décomposition)

```ruby
# Dans les paramètres - collecter les args
def foo(*args)
  args  # Array de tous les arguments
end
foo(1, 2, 3)  # => [1, 2, 3]

# Dans les appels - éclater un array
def bar(a, b, c)
  a + b + c
end
bar(*[1, 2, 3])  # => 6

# Assignation multiple
first, *rest = [1, 2, 3, 4]
first  # => 1
rest   # => [2, 3, 4]

*head, last = [1, 2, 3, 4]
head  # => [1, 2, 3]
last  # => 4

first, *middle, last = [1, 2, 3, 4, 5]
first   # => 1
middle  # => [2, 3, 4]
last    # => 5

# Convertir en array
a = *1        # => [1]
a = *nil      # => []
a = *"hello"  # => ["hello"]
a = *(1..3)   # => [1, 2, 3]
```

### Double splat `**` (hash/kwargs)

```ruby
# Collecter les keyword arguments
def foo(**kwargs)
  kwargs  # Hash
end
foo(a: 1, b: 2)  # => {a: 1, b: 2}

# Éclater un hash en kwargs
def bar(x:, y:)
  x + y
end
opts = {x: 1, y: 2}
bar(**opts)  # => 3

# Merger des hashes
h1 = {a: 1, b: 2}
h2 = {b: 3, c: 4}
merged = {**h1, **h2}  # => {a: 1, b: 3, c: 4}

# Combiner splat et double splat
def baz(*args, **kwargs)
  [args, kwargs]
end
baz(1, 2, a: 3)  # => [[1, 2], {a: 3}]
```

### Safe navigation `&.` (lonely operator)

```ruby
# Sans safe navigation
user && user.address && user.address.city

# Avec safe navigation
user&.address&.city  # => nil si user ou address est nil

# Exemples
nil&.to_s      # => nil
"hello"&.upcase  # => "HELLO"

# Avec array/hash
arr = nil
arr&.[](0)     # => nil
arr&.first     # => nil

hash = nil
hash&.dig(:a, :b)  # => nil
```

### Or-assign `||=` et And-assign `&&=`

```ruby
# ||= assigne seulement si nil ou false
x = nil
x ||= 5   # x = 5

x = false
x ||= 5   # x = 5

x = 0
x ||= 5   # x reste 0 (0 est truthy)

# Memoization pattern
def expensive_calc
  @result ||= begin
    # calcul coûteux...
    42
  end
end

# &&= assigne seulement si truthy
x = 5
x &&= 10  # x = 10

x = nil
x &&= 10  # x reste nil

# Use case: modifier seulement si existe
user.name &&= user.name.strip
```

### Range `..` et `...`

```ruby
# .. inclut la fin
(1..5).to_a   # => [1, 2, 3, 4, 5]

# ... exclut la fin
(1...5).to_a  # => [1, 2, 3, 4]

# Dans les slices
arr = [0, 1, 2, 3, 4]
arr[1..3]   # => [1, 2, 3]
arr[1...3]  # => [1, 2]

# Endless range (Ruby 2.6+)
(1..)       # 1 à l'infini
arr[2..]    # => [2, 3, 4] (du 2ème à la fin)

# Beginless range (Ruby 2.7+)
(..5)       # début jusqu'à 5
arr[..2]    # => [0, 1, 2]

# Case/when
case score
when 90..100 then "A"
when 80...90 then "B"
when 70...80 then "C"
else "F"
end
```

### Ternaire `? :`

```ruby
condition ? valeur_si_true : valeur_si_false

age = 20
status = age >= 18 ? "adult" : "minor"  # => "adult"

# Peut être chaîné (mais éviter l'abus)
x = a ? b : c ? d : e
```

### Proc/Lambda/Block operators

```ruby
# & convertit bloc <-> proc
def foo(&block)
  block.call
end

# Convertir Symbol en proc
[1, 2, 3].map(&:to_s)  # équivalent à .map { |n| n.to_s }

# Convertir proc en bloc
my_proc = Proc.new { |n| n * 2 }
[1, 2, 3].map(&my_proc)  # => [2, 4, 6]

# -> syntaxe lambda (stabby lambda)
add = ->(a, b) { a + b }
add.call(1, 2)  # => 3
add.(1, 2)      # => 3 (syntaxe courte)
add[1, 2]       # => 3 (autre syntaxe)
```

### Pattern matching (Ruby 3.0+)

```ruby
# case/in
case [1, 2, 3]
in [a, b, c]
  puts "#{a}, #{b}, #{c}"
end

# Hash pattern
case {name: "John", age: 30}
in {name: String => n, age: 18..}
  puts "Adult: #{n}"
end

# Guard clause
case value
in x if x > 10
  puts "big"
in x
  puts "small"
end

# Array patterns
case arr
in []
  "empty"
in [x]
  "single: #{x}"
in [x, *rest]
  "first: #{x}, rest: #{rest}"
end

# => operator (rightward assignment)
{a: 1, b: 2} => {a:, b:}  # a = 1, b = 2

# in operator (pattern check, returns bool)
{a: 1} in {a: Integer}  # => true
```

### Opérateurs bitwise

```ruby
| Opérateur | Nom | Exemple |
|-----------|-----|---------|
| `&` | AND bitwise | `5 & 3  # => 1` (0101 & 0011 = 0001) |
| `\|` | OR bitwise | `5 \| 3  # => 7` (0101 \| 0011 = 0111) |
| `^` | XOR bitwise | `5 ^ 3  # => 6` (0101 ^ 0011 = 0110) |
| `~` | NOT bitwise | `~5  # => -6` |
| `<<` | Left shift | `2 << 3  # => 16` |
| `>>` | Right shift | `16 >> 2  # => 4` |

# Use case courant: flags
READ = 1    # 001
WRITE = 2   # 010
EXEC = 4    # 100

perms = READ | WRITE  # 011
perms & READ != 0     # => true (has read)
perms & EXEC != 0     # => false (no exec)
```

### Defined? operator

```ruby
# Vérifie si quelque chose est défini
defined? foo         # => nil si foo n'existe pas
defined? @var        # => "instance-variable" ou nil
defined? @@var       # => "class variable" ou nil
defined? $global     # => "global-variable" ou nil
defined? SomeClass   # => "constant" ou nil
defined? some_method # => "method" ou nil
defined? yield       # => "yield" ou nil (dans une méthode avec bloc)

# Use case: vérifier avant d'utiliser
if defined?(Rails)
  # Code spécifique Rails
end
```

### BEGIN et END

```ruby
# BEGIN s'exécute au chargement du fichier (avant tout)
BEGIN {
  puts "Starting..."
}

# END s'exécute à la fin du programme
END {
  puts "Cleaning up..."
}

# Ordre: tous les BEGIN, puis le code, puis tous les END
```

### Autres opérateurs utiles

```ruby
# .. dans flip-flop (rare mais existe)
# Active/désactive basé sur conditions
DATA.each_line do |line|
  print line if line =~ /start/ .. line =~ /end/
end

# __FILE__ et __LINE__
puts __FILE__  # => chemin du fichier courant
puts __LINE__  # => numéro de ligne courant

# __method__ et __callee__
def foo
  puts __method__  # => :foo
end

# __dir__ (Ruby 2.0+)
puts __dir__  # => répertoire du fichier courant
```

---

## Bonus: Trucs d'interview courants

### Différence `==`, `eql?`, `equal?`, `===`

```ruby
1 == 1.0      # => true  (compare valeur, avec coercion)
1.eql?(1.0)   # => false (compare valeur ET type)
a.equal?(b)   # => true seulement si même object_id

# === est contextuel (case equality)
(1..5) === 3        # => true
/hello/ === "hello world"  # => true
String === "hi"     # => true
```

### Symbols vs Strings

```ruby
# Symbols: immutables, uniques en mémoire, rapides pour comparaison
:foo.object_id == :foo.object_id  # => true

# Strings: mutables, nouvelle instance à chaque fois
"foo".object_id == "foo".object_id  # => false (sauf frozen)
```

### Shallow vs Deep copy

```ruby
# dup/clone = shallow copy
a = [[1, 2], [3, 4]]
b = a.dup
b[0][0] = 999
a[0][0]  # => 999 (modifié aussi!)

# Deep copy avec Marshal
c = Marshal.load(Marshal.dump(a))
```

### Method lookup path

```ruby
class A; end
module M; end
class B < A
  include M
end

B.ancestors  # => [B, M, A, Object, Kernel, BasicObject]
# Lookup: B -> M -> A -> Object -> Kernel -> BasicObject
```
