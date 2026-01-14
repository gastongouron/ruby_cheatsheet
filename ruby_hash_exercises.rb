# =============================================================================
# EXERCICES RUBY - HASH / INTERVIEW CLASSIQUES
# Chaque exercice a un énoncé clair et des commentaires ligne par ligne
# =============================================================================


# =============================================================================
# EXERCICE 1 : TWO SUM
# =============================================================================
# ÉNONCÉ :
# Étant donné un tableau d'entiers et une valeur cible (target),
# retourner les INDICES des deux nombres dont la somme égale le target.
# On suppose qu'il existe exactement une solution.
# 
# Exemple :
#   Input:  nums = [2, 7, 11, 15], target = 9
#   Output: [0, 1]   (car nums[0] + nums[1] = 2 + 7 = 9)
#
# Contrainte : O(n) en temps (donc pas de double boucle)
# =============================================================================

def two_sum(nums, target)
  seen = {}                              # Hash pour stocker {valeur => index}
  
  nums.each_with_index do |n, i|         # Parcourir chaque nombre avec son index
    complement = target - n              # Ce qu'il nous faut pour atteindre target
    
    if seen.key?(complement)             # Si on a déjà vu ce complément avant
      return [seen[complement], i]       # Retourner [index du complément, index actuel]
    end
    
    seen[n] = i                          # Sinon, mémoriser ce nombre et son index
  end
  
  nil                                    # Aucune solution trouvée (ne devrait pas arriver)
end

# Test
puts "=== TWO SUM ==="
p two_sum([2, 7, 11, 15], 9)             # => [0, 1]
p two_sum([3, 2, 4], 6)                  # => [1, 2]
puts


# =============================================================================
# EXERCICE 2 : ANAGRAMMES
# =============================================================================
# ÉNONCÉ :
# Vérifier si deux chaînes sont des anagrammes l'une de l'autre.
# Deux mots sont anagrammes s'ils contiennent exactement les mêmes lettres
# avec les mêmes fréquences.
#
# Exemple :
#   "listen" et "silent" => true
#   "hello" et "world"   => false
# =============================================================================

# Solution 1 : Avec tally (Ruby 2.7+)
def anagram_v1?(s1, s2)
  s1.chars.tally == s2.chars.tally       # tally retourne un hash {char => count}
end                                      # On compare directement les deux hashs

# Solution 2 : Manuelle avec comptage
def anagram_v2?(s1, s2)
  return false if s1.length != s2.length # Longueurs différentes = pas anagramme
  
  count = Hash.new(0)                    # Hash avec valeur par défaut 0
  
  s1.each_char { |c| count[c] += 1 }     # Incrémenter pour chaque char de s1
  s2.each_char { |c| count[c] -= 1 }     # Décrémenter pour chaque char de s2
  
  count.values.all?(&:zero?)             # Vrai si tous les compteurs sont à 0
end

# Test
puts "=== ANAGRAMMES ==="
p anagram_v1?("listen", "silent")        # => true
p anagram_v1?("hello", "world")          # => false
p anagram_v2?("anagram", "nagaram")      # => true
puts


# =============================================================================
# EXERCICE 3 : PREMIER CARACTÈRE UNIQUE
# =============================================================================
# ÉNONCÉ :
# Trouver le premier caractère qui n'apparaît qu'une seule fois dans une string.
# Retourner nil si tous les caractères sont répétés.
#
# Exemple :
#   "aabccd" => "b"  (a et c apparaissent 2 fois, b est le premier unique)
#   "aabb"   => nil  (aucun caractère unique)
# =============================================================================

def first_uniq_char(s)
  count = s.chars.tally                  # Compter les occurrences de chaque char
  
  s.chars.find { |c| count[c] == 1 }     # Trouver le premier char avec count == 1
end                                      # find retourne le premier qui matche

# Version alternative plus explicite
def first_uniq_char_v2(s)
  count = Hash.new(0)                    # Hash avec default 0
  
  s.each_char { |c| count[c] += 1 }      # Premier passage : compter
  
  s.each_char do |c|                     # Deuxième passage : trouver
    return c if count[c] == 1            # Retourner dès qu'on trouve un unique
  end
  
  nil                                    # Aucun unique trouvé
end

# Test
puts "=== PREMIER CARACTÈRE UNIQUE ==="
p first_uniq_char("aabccd")              # => "b"
p first_uniq_char("aabb")                # => nil
p first_uniq_char("leetcode")            # => "l"
puts


# =============================================================================
# EXERCICE 4 : GROUPER LES ANAGRAMMES
# =============================================================================
# ÉNONCÉ :
# Étant donné un tableau de mots, grouper ensemble tous les anagrammes.
#
# Exemple :
#   Input:  ["eat", "tea", "tan", "ate", "nat", "bat"]
#   Output: [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
#
# L'ordre des groupes et l'ordre dans chaque groupe n'importent pas.
# =============================================================================

def group_anagrams(words)
  words.group_by { |w| w.chars.sort }    # Grouper par signature (lettres triées)
       .values                           # On ne garde que les groupes (pas les clés)
end

# Version plus explicite
def group_anagrams_v2(words)
  groups = Hash.new { |h, k| h[k] = [] } # Hash où chaque clé init un array vide
  
  words.each do |word|                   # Pour chaque mot
    signature = word.chars.sort.join     # Créer une signature : "eat" -> "aet"
    groups[signature] << word            # Ajouter le mot au groupe correspondant
  end
  
  groups.values                          # Retourner uniquement les groupes
end

# Test
puts "=== GROUPER LES ANAGRAMMES ==="
p group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
# => [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
puts


# =============================================================================
# EXERCICE 5 : COMPTAGE DE MOTS (Word Frequency)
# =============================================================================
# ÉNONCÉ :
# Compter le nombre d'occurrences de chaque mot dans un texte.
# Ignorer la casse (tout en minuscules).
#
# Exemple :
#   "Hello world hello" => {"hello" => 2, "world" => 1}
# =============================================================================

def word_count(text)
  text.downcase                          # Convertir en minuscules
      .scan(/\w+/)                       # Extraire tous les mots (regex: chars alphanumériques)
      .tally                             # Compter les occurrences
end

# Version manuelle
def word_count_v2(text)
  count = Hash.new(0)                    # Hash avec default 0
  
  words = text.downcase.scan(/\w+/)      # Extraire les mots en minuscules
  
  words.each { |word| count[word] += 1 } # Incrémenter le compteur pour chaque mot
  
  count                                  # Retourner le hash
end

# Test
puts "=== COMPTAGE DE MOTS ==="
p word_count("Hello world hello World")
# => {"hello"=>2, "world"=>2}
puts


# =============================================================================
# EXERCICE 6 : TROUVER LES DOUBLONS
# =============================================================================
# ÉNONCÉ :
# Retourner tous les éléments qui apparaissent plus d'une fois dans un tableau.
#
# Exemple :
#   [1, 2, 3, 2, 4, 3] => [2, 3]
# =============================================================================

def find_duplicates(arr)
  arr.tally                              # Compter les occurrences
     .select { |_, count| count > 1 }    # Garder seulement ceux avec count > 1
     .keys                               # Extraire les clés (les valeurs dupliquées)
end

# Version manuelle
def find_duplicates_v2(arr)
  count = Hash.new(0)                    # Hash avec default 0
  duplicates = []                        # Array pour stocker les doublons
  
  arr.each do |el|                       # Pour chaque élément
    count[el] += 1                       # Incrémenter son compteur
    
    if count[el] == 2                    # Si c'est la 2ème occurrence
      duplicates << el                   # L'ajouter aux doublons
    end                                  # (on ne l'ajoute pas à 3, 4, etc.)
  end
  
  duplicates
end

# Test
puts "=== TROUVER LES DOUBLONS ==="
p find_duplicates([1, 2, 3, 2, 4, 3])    # => [2, 3]
p find_duplicates([1, 1, 1, 2, 2])       # => [1, 2]
puts


# =============================================================================
# EXERCICE 7 : INTERSECTION DE DEUX ARRAYS
# =============================================================================
# ÉNONCÉ :
# Trouver l'intersection de deux tableaux.
# Chaque élément dans le résultat doit apparaître autant de fois
# qu'il apparaît dans les deux tableaux.
#
# Exemple :
#   [1, 2, 2, 3] ∩ [2, 2, 4] => [2, 2]
#   (2 apparaît 2 fois dans les deux, donc on le garde 2 fois)
# =============================================================================

def intersection(a, b)
  count = a.tally                        # Compter les occurrences dans a
  
  b.select do |x|                        # Pour chaque élément de b
    if count[x]&.positive?               # Si x existe dans count et count > 0
      count[x] -= 1                      # Décrémenter (pour ne pas réutiliser)
      true                               # Garder cet élément
    else
      false                              # Sinon, ne pas le garder
    end
  end
end

# Version plus lisible
def intersection_v2(a, b)
  count_a = a.tally                      # Compter dans le premier array
  result = []                            # Résultat
  
  b.each do |el|                         # Pour chaque élément du second array
    if count_a[el] && count_a[el] > 0    # S'il existe dans a et encore dispo
      result << el                       # L'ajouter au résultat
      count_a[el] -= 1                   # Marquer comme utilisé
    end
  end
  
  result
end

# Test
puts "=== INTERSECTION ==="
p intersection([1, 2, 2, 3], [2, 2, 4])  # => [2, 2]
p intersection([4, 9, 5], [9, 4, 9, 8, 4])  # => [9, 4] ou [4, 9]
puts


# =============================================================================
# EXERCICE 8 : LRU CACHE (Least Recently Used)
# =============================================================================
# ÉNONCÉ :
# Implémenter un cache LRU avec une capacité fixe.
# - get(key) : retourner la valeur si elle existe, -1 sinon
# - put(key, value) : insérer ou mettre à jour la valeur
# 
# Quand le cache est plein, on supprime l'élément le moins récemment utilisé.
# Chaque get() et put() compte comme un "usage" de la clé.
#
# Astuce : En Ruby 1.9+, les Hash maintiennent l'ordre d'insertion.
# =============================================================================

class LRUCache
  def initialize(capacity)
    @capacity = capacity                 # Taille max du cache
    @cache = {}                          # Hash ordonné (Ruby 1.9+)
  end
  
  def get(key)
    return -1 unless @cache.key?(key)    # Clé absente => retourner -1
    
    value = @cache.delete(key)           # Supprimer la clé (pour la réinsérer à la fin)
    @cache[key] = value                  # Réinsérer (devient "most recently used")
    value                                # Retourner la valeur
  end
  
  def put(key, value)
    @cache.delete(key)                   # Supprimer si existe (pour mettre à jour l'ordre)
    @cache[key] = value                  # Insérer à la fin (most recently used)
    
    if @cache.size > @capacity           # Si on dépasse la capacité
      oldest_key = @cache.first[0]       # Le premier élément est le plus ancien
      @cache.delete(oldest_key)          # Le supprimer
    end
  end
  
  def to_s
    @cache.inspect                       # Pour debug
  end
end

# Test
puts "=== LRU CACHE ==="
cache = LRUCache.new(2)                  # Capacité de 2

cache.put(1, "a")                        # Cache: {1 => "a"}
cache.put(2, "b")                        # Cache: {1 => "a", 2 => "b"}
p cache.get(1)                           # => "a", Cache: {2 => "b", 1 => "a"}
cache.put(3, "c")                        # Éjecte 2 (LRU), Cache: {1 => "a", 3 => "c"}
p cache.get(2)                           # => -1 (n'existe plus)
p cache.get(3)                           # => "c"
puts


# =============================================================================
# EXERCICE 9 : SOUS-ARRAY AVEC SOMME = K
# =============================================================================
# ÉNONCÉ :
# Compter le nombre de sous-tableaux contigus dont la somme égale k.
#
# Exemple :
#   nums = [1, 1, 1], k = 2
#   Output: 2
#   Explication : [1,1] (indices 0-1) et [1,1] (indices 1-2)
#
# Technique : Utiliser les "prefix sums" avec un hash
# =============================================================================

def subarray_sum(nums, k)
  count = 0                              # Nombre de sous-arrays trouvés
  sum = 0                                # Somme cumulative (prefix sum)
  seen = { 0 => 1 }                      # Hash {prefix_sum => nb d'occurrences}
                                         # On init avec 0 => 1 (somme vide)
  
  nums.each do |n|                       # Pour chaque nombre
    sum += n                             # Ajouter à la somme cumulative
    
    # Si (sum - k) existe dans seen, ça veut dire qu'il y a un sous-array
    # qui commence après ce point et dont la somme = k
    complement = sum - k                 # Ce qu'on cherche dans les prefix sums
    count += seen[complement] || 0       # Ajouter le nb d'occurrences de ce prefix
    
    seen[sum] = (seen[sum] || 0) + 1     # Mémoriser ce prefix sum
  end
  
  count
end

# Explication visuelle :
# nums = [1, 1, 1], k = 2
# 
# i=0: sum=1, cherche sum-k=-1 (non trouvé), seen={0=>1, 1=>1}
# i=1: sum=2, cherche sum-k=0 (trouvé 1 fois!), count=1, seen={0=>1, 1=>1, 2=>1}
# i=2: sum=3, cherche sum-k=1 (trouvé 1 fois!), count=2, seen={0=>1, 1=>1, 2=>1, 3=>1}
#
# Les 2 sous-arrays sont [1,1] (i=0 à 1) et [1,1] (i=1 à 2)

# Test
puts "=== SOUS-ARRAY SOMME = K ==="
p subarray_sum([1, 1, 1], 2)             # => 2
p subarray_sum([1, 2, 3], 3)             # => 2 ([1,2] et [3])
puts


# =============================================================================
# EXERCICE 10 : ISOMORPHIC STRINGS
# =============================================================================
# ÉNONCÉ :
# Deux strings sont "isomorphiques" si on peut remplacer chaque caractère
# de la première pour obtenir la seconde, avec un mapping 1-to-1.
#
# Exemple :
#   "egg" et "add" => true  (e->a, g->d)
#   "foo" et "bar" => false (o devrait mapper vers a ET r, impossible)
#   "paper" et "title" => true (p->t, a->i, e->l, r->e)
# =============================================================================

def isomorphic?(s, t)
  return false if s.length != t.length   # Longueurs différentes = pas isomorphique
  
  s_to_t = {}                            # Mapping de s vers t
  t_to_s = {}                            # Mapping inverse de t vers s
  
  s.chars.zip(t.chars).all? do |sc, tc|  # Pour chaque paire de caractères
    # Vérifier que le mapping est cohérent dans les deux sens
    
    s_to_t[sc] ||= tc                    # Si sc pas encore mappé, le mapper à tc
    t_to_s[tc] ||= sc                    # Si tc pas encore mappé, le mapper à sc
    
    s_to_t[sc] == tc && t_to_s[tc] == sc # Vrai si les deux mappings sont cohérents
  end
end

# Version plus explicite
def isomorphic_v2?(s, t)
  return false if s.length != t.length
  
  s_to_t = {}                            # char de s -> char de t
  t_to_s = {}                            # char de t -> char de s
  
  s.length.times do |i|                  # Pour chaque index
    sc = s[i]                            # Caractère de s
    tc = t[i]                            # Caractère de t
    
    # Si sc est déjà mappé à autre chose que tc => false
    if s_to_t.key?(sc)
      return false if s_to_t[sc] != tc
    else
      s_to_t[sc] = tc                    # Créer le mapping
    end
    
    # Si tc est déjà mappé à autre chose que sc => false
    if t_to_s.key?(tc)
      return false if t_to_s[tc] != sc
    else
      t_to_s[tc] = sc                    # Créer le mapping inverse
    end
  end
  
  true                                   # Tous les mappings sont cohérents
end

# Test
puts "=== ISOMORPHIC STRINGS ==="
p isomorphic?("egg", "add")              # => true
p isomorphic?("foo", "bar")              # => false
p isomorphic?("paper", "title")          # => true
puts


# =============================================================================
# EXERCICE 11 : RANSOM NOTE
# =============================================================================
# ÉNONCÉ :
# Vérifier si on peut construire un message (ransom) en utilisant les lettres
# disponibles dans un magazine. Chaque lettre ne peut être utilisée qu'une fois.
#
# Exemple :
#   ransom = "aa", magazine = "aab" => true (on a 2 'a' dans magazine)
#   ransom = "aa", magazine = "ab"  => false (on n'a qu'un seul 'a')
# =============================================================================

def can_construct?(ransom, magazine)
  available = magazine.chars.tally      # Compter les lettres disponibles
  
  ransom.each_char do |c|               # Pour chaque lettre du ransom
    return false unless available[c]&.positive?  # Si pas dispo, impossible
    available[c] -= 1                   # Marquer comme utilisée
  end
  
  true                                  # Toutes les lettres trouvées
end

# Version alternative
def can_construct_v2?(ransom, magazine)
  needed = ransom.chars.tally           # Ce qu'on a besoin
  available = magazine.chars.tally      # Ce qu'on a
  
  needed.all? do |char, count|          # Pour chaque lettre nécessaire
    (available[char] || 0) >= count     # Vérifier qu'on en a assez
  end
end

# Test
puts "=== RANSOM NOTE ==="
p can_construct?("aa", "aab")            # => true
p can_construct?("aa", "ab")             # => false
p can_construct?("hello", "helloworld")  # => true
puts


# =============================================================================
# EXERCICE 12 : LONGEST CONSECUTIVE SEQUENCE
# =============================================================================
# ÉNONCÉ :
# Trouver la longueur de la plus longue séquence de nombres consécutifs.
# L'ordre dans le tableau n'importe pas.
#
# Exemple :
#   [100, 4, 200, 1, 3, 2] => 4
#   La séquence est [1, 2, 3, 4]
#
# Contrainte : O(n) en temps (pas de tri!)
# =============================================================================

def longest_consecutive(nums)
  return 0 if nums.empty?                # Cas vide
  
  num_set = nums.to_set                  # Convertir en Set pour lookup O(1)
                                         # (équivalent à nums.to_h { |n| [n, true] })
  max_length = 0                         # Plus longue séquence trouvée
  
  nums.each do |n|                       # Pour chaque nombre
    # Optimisation : ne démarrer que si c'est le DÉBUT d'une séquence
    # (i.e., n-1 n'existe pas)
    next if num_set.include?(n - 1)      # Si n-1 existe, n n'est pas un début
    
    length = 1                           # Longueur courante
    
    # Compter combien de consécutifs suivent
    while num_set.include?(n + length)   # Tant que le suivant existe
      length += 1                        # Incrémenter la longueur
    end
    
    max_length = [max_length, length].max  # Mettre à jour le max
  end
  
  max_length
end

# Explication de l'optimisation :
# Sans le `next if num_set.include?(n - 1)`, on ferait du travail redondant.
# Par exemple avec [1, 2, 3, 4] :
#   - À partir de 1 : on compte 1->2->3->4, length=4
#   - À partir de 2 : on compte 2->3->4, length=3 (redondant!)
#   - À partir de 3 : on compte 3->4, length=2 (redondant!)
#   - À partir de 4 : on compte 4, length=1 (redondant!)
#
# Avec l'optimisation, on ne démarre que de 1 (car 0 n'existe pas).

# Test
puts "=== LONGEST CONSECUTIVE SEQUENCE ==="
p longest_consecutive([100, 4, 200, 1, 3, 2])  # => 4
p longest_consecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])  # => 9
puts


# =============================================================================
# BONUS : PATTERNS ET ASTUCES À RETENIR
# =============================================================================

puts "=== PATTERNS RÉCAPITULATIF ==="
puts <<~PATTERNS
  
  1. COMPTAGE
     Hash.new(0) puis hash[key] += 1
     Ou simplement : array.tally
  
  2. GROUPEMENT
     Hash.new { |h, k| h[k] = [] } puis hash[key] << item
     Ou simplement : array.group_by { |x| critère }
  
  3. TWO-SUM / COMPLÉMENT
     Stocker ce qu'on a vu, chercher le complément
     seen = {}; chercher target - current
  
  4. PREFIX SUM
     Somme cumulative + hash des sommes vues
     Permet de trouver des sous-arrays en O(n)
  
  5. BIJECTION / MAPPING
     Deux hashs pour mapping bidirectionnel
     s_to_t et t_to_s
  
  6. ORDRE D'INSERTION (Ruby 1.9+)
     Les Hash maintiennent l'ordre
     Utile pour LRU, file, etc.
  
  7. DEFAULT VALUES
     Hash.new(0)              # => default 0
     Hash.new { |h,k| h[k] = [] }  # => default array vide (nouveau à chaque clé)
  
  8. MÉTHODES UTILES
     .tally       # comptage
     .group_by    # groupement
     .transform_values  # modifier les valeurs
     .slice       # sous-hash par clés
     .dig         # accès nested safe
     .fetch       # get avec default ou erreur

PATTERNS

puts "\n=== FIN DES EXERCICES ==="
