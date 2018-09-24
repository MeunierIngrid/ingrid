Answer.destroy_all
Survey.destroy_all
Question.destroy_all
QuestionsCategory.destroy_all

if Rails.env.development?
  User.create!(email: 'jonathan.serafini@gmail.com', password: 'azerty')
end

questions_categories = [
  { title: "Intrapersonnel et existentiel",
    questions: [
      { title: "Depuis l'enfance je m'interroge souvent sur le sens de la vie, notre but sur terre, en tant qu'être humain", coefficient: 1 },
      { title: "J'ai besoin de donner sens à mon existence et de contribuer (à l'environnement, aux humains, aux animaux...). Cela s'exprime par un métier, l'art, la religion, du bénévolat", coefficient: 1 },
      { title: "Je suis intransigeant avec mes valeurs (tendance à les imposer aux autres)", coefficient: 1 },
      { title: "J'éprouve des émotions très fortes face à l'injustice et à l'iniquité", coefficient: 2 },
      { title: "L'argent et les biens matériels ne sont pas prioritaires pour moi", coefficient: 1 },
      { title: "Je suis attiré(e) par des expériences mystiques ou spirituelles qui fourniraient la base d'une compréhension plus profonde", coefficient: 1 },
      { title: "J'ai besoin de me sentir libre en toute circonstance (que je sois aux commandes pour décider)", coefficient: 1 },
      { title: "Je porte sur le monde un regard très lucide et brut (je vois les choses telles qu'elles sont)", coefficient: 1 },
      { title: "Je me pose des questions métaphysiques assez souvent.", coefficient: 2 },
      { title: "Je suis souvent envahi(e) par le doute et je remets facilement tout en question", coefficient: 2 },
      { title: "On me dit que je cherche la petite bête, que je ne suis jamais satisfait(e)", coefficient: 2 },
      { title: "Je préfère voir et prévoir négativement les éléments (pour pouvoir anticiper, ne pas être surpris), que d'être dans un état positif \"tout va bien se passer, s'il y a des problèmes on avisera\"", coefficient: 2 },
    ]
  },
  { title: "Hyperstimulabilités émotionnelle et sensorielle",
    questions: [
      { title: "Je suis très énergique, j'aime le mouvement, l'action. Ne rien faire m'est difficile (surtout intellectuellement)", coefficient: 1 },
      { title: "Je suis une personne impulsive", coefficient: 1 },
      { title: "Je suis souvent très ému(e) jusqu'aux larmes par la musique, les arts visuels ou les beaux paysages", coefficient: 1 },
      { title: "Je suis attiré(e) par les nouvelles expériences sensorielles (nourriture, musique, érotisme, changements d'environnement, …) ", coefficient: 1 },
      { title: "L'un (ou plusieurs) de mes sens est plus développé que chez la plupart des gens", coefficient: 2 },
      { title: "J'ai l'impression d'être souvent submergé(e) par des émotions intenses. Comme des tsunamis soudains, imprévisibles et qui dévastent tout à l'intérieur (8/10 au moins)", coefficient: 2 },
      { title: "J'ai l'impression de faire des grands 8 émotionnels. Dans une même journée, je peux passer d'un extrême à l'autre émotionnellement", coefficient: 2 },
      { title: "J'ai une mauvaise résistance à la frustration", coefficient: 1 },
    ]
  },
  { title: "Processus cognitif",
    questions: [
      { title: "On me dit que j'ai souvent un point de vue original, à contre-courant", coefficient: 2 },
      { title: "Je suis capable de fournir un travail très intense (travailler pour 2)", coefficient: 2 },
      { title: "J'ai une capacité d'attention et de persévérance : très forte si l'intérêt y est, nulle dans le cas contraire", coefficient: 1 },
      { title: "Je suis une personne très intuitive. Capable de sentir les choses sans savoir pourquoi, ni comment ", coefficient: 2 },
      { title: "Je suis une personne très curieuse et investigatrice. J'ai besoin de tout savoir, comprendre et décortiquer.", coefficient: 2 },
      { title: "Je change très souvent de centres d'intérêts (beaucoup de choses m'intéressent)", coefficient: 2 },
      { title: "J'ai un cerveau qui tourne en permanence, sans trouver le bouton Off, ça me fatigue", coefficient: 1 },
      { title: "On me dit souvent que je me pose trop de questions, que je complique les choses", coefficient: 2 },
      { title: "Je fais vite le tour d'un sujet et je m'ennuie rapidement", coefficient: 2 },
      { title: "Les tâches routinières et répétitives sont anxiogènes pour moi (surtout au travail)", coefficient: 2 },
      { title: "Je suis plus intéressé(e) par la vision conceptuelle globale d'un projet que par les détails pratiques (sa mise en place)", coefficient: 2 },
      { title: "Je suis souvent 2 conversations en parallèle (celle de mon interlocuteur et celle de la table d'à côté)", coefficient: 1 },
      { title: "J'aime faire des métaphores et/ou elles me permettent de mieux comprendre", coefficient: 2 },
      { title: "J'ai une grande capacité d'observation, notant les plus petits détails ", coefficient: 2 },
      { title: "J'ai tendance à faire beaucoup de digressions par rapport à une question ou un sujet (je me perds tout(e) seul(e))", coefficient: 2 },
      { title: "toujours besoin d'être dans un projet (personnel ou professionnel)", coefficient: 2 },
      { title: "Je suis friand(e) de jeux de mots", coefficient: 2 },
      { title: "J'aime me retrouver dans ma tête, dans mon monde (je suis un penseur indépendant et mentalement auto-suffisant)", coefficient: 2 },
      { title: "J'ai besoin de comprendre le pourquoi des choses pour les accepter ou pour exécuter une tâche", coefficient: 2 },
      { title: "J'ai souvent besoin de me mettre des défis (personnel ou professionnel) pour avancer ou ne pas m'ennuyer", coefficient: 2 },
      { title: "J'aime apprendre, tout et n'importe quoi, pourvu que j'apprenne", coefficient: 2 },
      { title: "Quand je suis enthousiaste, mes idées partent dans tous les sens (j'ai sans arrêt de nouvelles idées, de nouveaux ajouts à un projet... j'ai du mal à me canaliser)", coefficient: 2 },
      { title: "Je préfère parfois abandonner ou ne pas commencer une tâche, plutôt qu'à l'idée que je ne pourrais ne jamais la réaliser parfaitement (pas d'”à peu près”)", coefficient: 1 },
      { title: "Je mets souvent la barre très haute dans mes objectifs (voir inatteignable)", coefficient: 2 },
    ]
  },
  { title: "Interpersonnel (Interaction et société)",
    questions: [
      { title: "Je suis difficile à appréhender, à comprendre pour les autres", coefficient: 1 },
      { title: "J'ai le sentiment d'être bizarre ou décalé en société", coefficient: 1 },
      { title: "Je n'ai que quelques amis proches qui me connaissent bien, dont je suis intime", coefficient: 2 },
      { title: "J'ai du mal à tisser des relations et à me faire de nouveaux amis", coefficient: 1 },
      { title: "Je n'aime pas parler de la pluie et du beau temps (le \"frottement social\")", coefficient: 2 },
      { title: "Je prends le temps d'observer les gens avant de m'engager dans un groupe que je ne connais pas (j'analyse la situation et les gens d'abord)", coefficient: 2 },
      { title: "J'ai besoin de mon espace vital sinon je me sens vite envahi(e)", coefficient: 1 },
      { title: "J'accepte de respecter les règles uniquement si elles me semblent logiques et si elles ont un sens.", coefficient: 2 },
      { title: "Je préfère les petits comités (2-4 personnes) au groupe (+ de 4)", coefficient: 1 },
      { title: "J'ai du mal à déléguer et je préfère faire moi-même les choses ", coefficient: 1 },
      { title: "La compétition et le statut social ne m'intéressent pas", coefficient: 1 },
      { title: "J'ai tendance à souvent change rde travail ou de profession (ou à le faire si je le pouvais)", coefficient: 2 },
      { title: "J'ai des attachements émotionnels très intenses aux autres (amitié très forte et/ou grande fidélité amicale)", coefficient: 2 },
      { title: "Pour me sentir bien dans un groupe, il faut impérativement que mes valeurs soient respectées", coefficient: 1 },
      { title: "J'ai besoin de m'isoler fréquemment pour recharger les batteries", coefficient: 2 },
      { title: "Je ressens beaucoup d'empathie et de compassion pour les autres", coefficient: 2 },
      { title: "Pour pouvoir faire confiance, j'ai besoin de congruence (cohérence entre ce que l'on dit, fait et ressent. C'est dire ce que l'on fait et faire ce que l'on dit)", coefficient: 1 },
      { title: "J'ai souvent eu des problèmes relationnels avec la hiérarchie", coefficient: 2 },
    ]
  },
  { title: "Enfance",
    questions: [
      { title: "J'avais une grande curiosité intellectuelle, voulant toujours comprendre le comment du pourquoi", coefficient: 0 },
      { title: "J'étais réfractaire à l'entraînement et à l'exercice répétitif", coefficient: 0 },
      { title: "J'avais des méthodes d'apprentissage particulières qui m'étaient propres ", coefficient: 0 },
      { title: "J'étais perçu(e) comme ayant une grande énergie et vivacité, un besoin de stimulation continuelle (corporelle et intellectuelle)", coefficient: 0 },
      { title: "J'étais passionné(e) par des sujets types : l'univers, l'origine de l'humanité, la préhistoire, les dinosaures, l'astronomie...", coefficient: 0 },
      { title: "Je remettais en cause les méthodes d'enseignement de mes enseignants ", coefficient: 0 },
      { title: "Je portais un plus grand intérêt aux activités des adultes auxquels je voulais participer, qu'à celles des enfants de mon age", coefficient: 0 },
      { title: "Je voulais rapidement faire tout tout seul, sans accepter les consignes ni les règles. C'était tout seul et à ma façon.", coefficient: 0 },
      { title: "J 'ai eu des difficultés à trouver des copains avec qui j'avais les mêmes centres d'intérêt", coefficient: 0 },
      { title: "En cours je trouvais que ça allait trop lentement", coefficient: 0 },
      { title: "J'étais un(e) solitaire (par choix ou car être seul(e) était plus simple)", coefficient: 0 },
      { title: "Je préférais travailler seul(e) qu'en équipe  pour les exposés", coefficient: 0 },
      { title: "Je recherchais la compagnie de personnes plus âgées avec qui je préférais être (plus intéressante)", coefficient: 0 },
    ]
  }
]

questions_categories.each do |q_category|
  qc = QuestionsCategory.create(title: q_category[:title])
  q_category[:questions].each do |q|
    qc.questions.create(q)
  end
end

puts "#{QuestionsCategory.count} questions categories are create!"
puts "#{Question.count} questions are create!"
