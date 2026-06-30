#let chinese-font = "Noto Serif CJK SC"
#let english-font = "Noto Serif"

#let toc-entry(body, page-num, indent: 0em) = {
  let page-spacing = 2em
  block(
    above: 0.35em,
    below: 0.35em,
    inset: (left: indent),
    box(
      baseline: 100% - 0.65em,
      box(width: 100% - page-spacing)[
        #set par(justify: false, leading: 0.9em, spacing: 0.9em)
        #body
        #box(width: 1fr, inset: (left: 0.2em), repeat[.])
      ]
      + box(width: page-spacing, align(end, page-num))
    )
  )
}

#let mpi-bilingual-outline(
  title-cn: none,
  title-en: none,
  subtitle-cn: none,
  subtitle-en: none,
  show-toc: true,
  body,
) = {
  set text(font: (chinese-font, english-font), size: 10.5pt, lang: "zh")
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    numbering: "1",
  )
  set par(justify: true, leading: 1.5em, spacing: 1.5em, first-line-indent: (amount: 2em, all: true))
  set heading(numbering: none)
  show heading: it => block(above: 2em, below: 1.2em, it.body)
  show footnote: set text(size: 8pt)
  set footnote.entry(indent: 0pt)

  align(center)[
    #set par(leading: 1.5em, spacing: 0pt)
    #if title-cn != none {
      text(size: 1.4em, weight: "bold")[#title-cn]
    }
    #if subtitle-cn != none {
      linebreak()
      subtitle-cn
    }
    #v(1.5em)
    #if title-en != none {
      text(size: 1.2em, weight: "bold")[#title-en]
    }
    #if subtitle-en != none {
      linebreak()
      subtitle-en
    }
  ]

  v(2.5em)

  if show-toc {
    align(center)[#text(size: 1.2em)[目录 / Contents]]
    v(0.8em)
    set outline.entry(fill: repeat[.])
    outline(
      title: none,
      target: heading.where(outlined: true),
      indent: 1.5em,
    )
    pagebreak()
  }

  body
}

#show: mpi-bilingual-outline.with(
  title-cn: [人生百问],
  title-en: [100 Questions on Life],
  subtitle-cn: [菩提静修营·西园夜话答疑],
  subtitle-en: [——Evening Dialogues at the Bodhi Retreat, Xiyuan Temple],
)

#quote(block: true)[
  自2007年以来，苏州西园寺面向社会大众举办菩提静修营，每次七天，包括主题讲座、皈依共修、三皈五戒、八关斋戒、菩提心戒、禅修体验、寺院巡礼、行脚、传灯法会等。活动依佛法五大要素安排，有闻思修，含戒定慧，是不可多得的修学之旅，至今已举办十六届。每次活动期间，还会安排一场西园夜话，法师们与营员、义工相聚天王殿前，分享心得，答疑解惑。本文根据济群法师在历次夜话中的答疑整理。
  #v(0.8em)
  Since 2007, Suzhou Xiyuan Temple has hosted the Bodhi Retreat for the general public. Each retreat lasts seven days and includes thematic Dharma talks, group refuge practice, the Three Refuges and Five Precepts, the Eight Precepts, bodhicitta precepts, meditation experience sessions, temple tours, pilgrimage, and Dharma-light transmission ceremonies. The program is arranged around the five essential elements of Buddhist practice—study, contemplation, and practice; and precepts, concentration, and wisdom—making it a rare opportunity for spiritual cultivation. To date, sixteen retreats have been held. During each retreat, an evening dialogue is held in front of the Heavenly King Hall, where monastic teachers, retreatants, and volunteers gather to share reflections and clarify doubts. This article is compiled from Master Jiqun's responses during these evening dialogues.
]

== 一、走入佛门 / I. Entering the Dharma Door <ch01>

=== 善用理性但不作为唯一标准 / Use Reason Skillfully, but Not as the Only Standard <ch01-q01>

_问：_ 我还没皈依，因为理性让我对个别法义不能完全接受，觉得贸然皈依是一种不诚实。但我也存在困惑和烦恼，希望有力量让我解脱，感觉很矛盾。

_Q:_ I haven't taken refuge yet, because reason keeps me from fully accepting certain points of the Dharma, and I feel that taking refuge lightly would be dishonest. Yet I also have confusion and afflictions, and hope for a power that can liberate me. I feel very conflicted.

_答：_ 不论对生活还是学佛，理性思考都很重要，但要善用理性，否则会带来麻烦。动物吃饱喝足就没问题了，但人满足生存所需后还会妄念纷飞，烦恼重重，而且坏起来是动物望尘莫及的。这都是理性惹的祸。

_A:_ Whether in life or in learning Buddhism, rational thinking is very important, but we must use reason skillfully; otherwise it will bring trouble. Animals are fine once they have eaten and drunk their fill, but after people's basic needs are met, their delusions run wild and their afflictions weigh heavily, and when humans turn bad, animals are left far behind. All this is caused by reason.

如何善用理性？必须接受智慧文化，对人生和世界有正确认识。如果三观有偏差，在此指导下的理性思考必然存在问题，结果害己害人。此外，理性无法直接抵达真理，这是西方哲学家也已认识到的。所以我们不要成为偏执的理性主义者，以理性作为认识世界的唯一标准，什么问题都希望通过理性得到解释和解决。

How do we use reason skillfully? We must accept a culture of wisdom and have a correct understanding of life and the world. If our worldview is off, then rational thinking guided by it will necessarily be flawed, and the result will harm ourselves and others. Furthermore, reason cannot directly reach the truth, a point recognized even by Western philosophers. Therefore we should not become dogmatic rationalists who take reason as the only standard for knowing the world and hope that reason can explain and solve every problem.

尤其对佛法信仰来说，虽然理性是闻思修的重要基础，但最终必须超越理性，才能通达真相，所谓言语道断、心行处灭。否则还是意识层面的认识，是不究竟的。对个别法义不能接受时，不妨先以理性接受可以接受的部分，但保持开放的心态，不以现有认识排斥其他。随着学习的深入，认识也会随之提高。

Especially for faith in the Dharma: although reason is an important foundation for study, contemplation, and practice, ultimately we must transcend reason in order to realize the true nature, as the saying goes, "Words fail, and mental activity ceases."

=== 解脱的本身就是意义 / Liberation Itself Is the Meaning <ch01-q02>

_问：_ 学佛最终只是让自己和众生解脱吗？如果人病了，治好后就要过自己的生活。那么解脱后不必追求更有意义的事吗？

_Q:_ In the end, is learning Buddhism only about liberating ourselves and all beings? If a person is sick, after being cured they get on with their own life. Then after liberation, do we not need to pursue something more meaningful?

_答：_ 什么是更有意义的事？不仅学佛是为了解脱，世人忙来忙去，也是为了解脱。挣钱是为了从贫困中解脱，成家是为了从单身状态中解脱。佛教所说的解脱，是解脱轮回，解脱生死，这才是究竟的解脱。

_A:_ What could be more meaningful? Not only is learning Buddhism for the sake of liberation; worldly people rush about for liberation too. Earning money is for liberation from poverty, and starting a family is for liberation from being single. The liberation spoken of in Buddhism is liberation from samsara, liberation from birth and death—this is the ultimate liberation.

仅仅从现象看，人们会觉得青春、爱情、财富、事业都值得追求，如果解脱了，这些梦想怎么实现？其实我们真正要解脱的是轮回本质，是内心的迷惑和烦恼。迷惑，是看不清生命真相，不知道"我是谁”，不知道"生从何来，死往何去”，不知道"活着为什么”；烦恼，是孤独、恐惧、焦躁、没有安全感等负面情绪。一旦解脱惑业，不论做什么，也不论在什么时空，我们都能自由自在。所以说，解脱和做什么并不矛盾，只是立足点完全不同。

On the surface, people feel that youth, love, wealth, and career are all worth pursuing; if we are liberated, how can these dreams still be realized? In fact, what we truly need to liberate ourselves from is the nature of samsara: the delusion and affliction within our minds.

佛陀之所以得大自在，正是因为解脱惑业，开启无限的慈悲和智慧。尤其是大乘佛法，不仅要自己解脱，还要帮助众生共同解脱。所以解脱不仅是解决问题的过程，本身就是生命的意义所在，没什么比这更有意义了。

The reason the Buddha attained great freedom and ease is precisely that he was liberated from delusion and karma and awakened boundless compassion and wisdom.

=== 怎么找到适合自己的法门 / How to Find a Dharma Door That Suits You <ch01-q03>

_问：_ 皈依后如何进一步修学？怎样找到适合自己的法门？

_Q:_ How should I continue my study and practice after taking refuge? How can I find a Dharma door that suits me?

_答：_ 皈依后的进一步修学，是很多信众的普遍问题。在今天这个资讯发达的时代，我们可以接触不同宗派乃至不同语系的法门，可以听到全世界大德们的开示。但这些多样化的选择，对初学者不见得有益。因为他们并未具备选择能力，多半只能根据个人感觉而非对法义的理解作出判断。但凡夫的感觉又是变化无常的，所以不少人就热衷于跑庙找师父，天南地北，到处参访。而每位善知识的教导未必一致，最后就可能一片混乱。更有甚者，还会因此谤法谤僧。

_A:_ Further study and practice after taking refuge is a common concern for many practitioners. In today's information-rich age, we can encounter methods from different schools and even different language traditions, and we can hear teachings from great masters around the world. But this variety of choices is not always beneficial for beginners. They do not yet have the ability to choose, so for the most part they can only go by personal feeling rather than understanding of the Dharma. Yet the feelings of ordinary beings are impermanent and changeable, so many people eagerly run from temple to temple looking for teachers, traveling far and wide.

所以建议大家先奠定修学基础，知道佛法要领和修行次第是什么，这样就不会偏执一端或不得要领了。三级修学就是针对这些问题设立的大众化修学体系，类似公共课，能与任何法门兼容，也是学习任何法门不可或缺的基础。有了这样的基础，自然会知道什么是适合自己的。

Therefore I suggest that you first establish a foundation in study and practice, knowing what the essentials of the Dharma are and what the stages of cultivation are, so that you will not be biased toward one extreme or miss the point. Three-Stage Practice is a mass-oriented system of study and practice designed to address these problems, similar to a general curriculum; it is compatible with any Dharma door and is an indispensable foundation for studying any method.

=== 学佛该从学儒开始吗 / Should One Begin Learning Buddhism by Studying Confucianism? <ch01-q04>

_问：_ 作为佛弟子，学习儒家典籍是否犯三皈戒？现在有人提倡把《弟子规》作为学佛基础，怎么看待这个现象？

_Q:_ As a Buddhist disciple, does studying Confucian classics violate the Three Refuges precepts? Some people now advocate taking the _Dizigui_ as a foundation for learning Buddhism. What do you think of this phenomenon?

_答：_ 学习四书五经等世间知识不算犯戒，但不可将此作为皈依处，否则就违背了三皈依中"皈依法，终不皈依外道典籍”的誓言。

_A:_ Studying worldly knowledge such as the Four Books and Five Classics is not a violation of precepts, but you must not take these as your refuge; otherwise you violate the vow in the Three Refuges, "I take refuge in the Dharma, and will never take refuge in non-Buddhist scriptures."

儒释道的相融古已有之。因为儒家是中国本土文化，其内容为人熟知，所以古德在弘法时，有时会借用儒家思想来解读，以此作为人们认识佛法的方便。那今天的人是否也需要这样呢？我觉得未必。因为时代变了，很多人并没有儒家文化的基础，直接学习佛典可能更容易。

The integration of Confucianism, Buddhism, and Daoism has existed since ancient times. Because Confucianism is the indigenous culture of China and its contents are well known, ancient masters sometimes borrowed Confucian ideas to explain the Dharma when propagating it, using this as a skillful means for people to understand Buddhism. Do people today still need this? Not necessarily.

事实上，儒学和佛法并没有必然联系。虽然儒家的伦理纲常对建立世间道德很重要，但佛法本身也有完善的人伦道德，是建立在缘起因果的基础上，有强大的哲学体系为背景，更具有说服力。所以学佛不一定要以儒家道德为基础，不一定先学《弟子规》再学三皈依。当然，你在学三皈依的过程中，学学《弟子规》也无妨，但不要形成必然的关系。

In fact, Confucian learning and the Buddhadharma are not necessarily connected. Although Confucian ethics and social norms are important for establishing worldly morality, the Buddhadharma itself also has a complete human ethics, founded on dependent origination and cause and effect, backed by a powerful philosophical system, and therefore more persuasive.

=== 博采众长需要高度 / Drawing on Many Strengths Requires Height <ch01-q05>

_问：_ 我对佛法很敬仰，但觉得儒家和道家也很有道理。对于没皈依的人来说，能否将佛法作为顶层建筑，同时将儒家、道家的思想为工具，指导自己为人处世，成就理想人生？

_Q:_ I deeply respect the Buddhadharma, but I also feel that Confucianism and Daoism make good sense. For someone who has not yet taken refuge, can one take the Buddhadharma as the overarching framework while using Confucian and Daoist thought as tools to guide one's conduct in society and achieve an ideal life?

_答：_ 当我们有了佛法见地后，一切法都可以成为佛法。因为这种见地代表对人生的认识高度。立足于此，可以吸收儒家、道家包括西方哲学的长处。虽然他们的理论来自理性思考，缺乏实修体证，没能究竟通达心性，但也是古今中外智者们的智慧结晶，对很多人是有启发和借鉴作用的。

_A:_ Once we have the view of the Dharma, all dharmas can become Dharma. Because this view represents a higher understanding of life.

需要注意的是，这些理论是基于不同的思想体系，如果没有很强的吸收能力，看多了容易消化不良，甚至觉得彼此矛盾，无所适从。所以自己的定位和认识高度很重要。此外，人的精力很有限，应该集中精力一门深入，以后真有余力了，再广泛涉猎也不迟。如果开始就把战线拉得很长，恐怕力有不逮。

These theories are based on different systems of thought; if you lack a strong ability to assimilate them, reading too much can easily lead to indigestion, and you may even feel that they contradict one another and not know what to do. Therefore our own position and level of understanding are very important. Moreover, human energy is very limited; you should concentrate your energy and go deeply into one door, and only later, if you truly have extra strength, it is not too late to read widely.

其实对于学佛者来说，不论生活还是修行，都能在佛法中得到智慧引导。佛法的作用并不仅仅在于顶层建筑，而是可以遍一切处。了解其他思想，主要是为了弘法的方便。因为众生根机各异，以他们感兴趣的内容作为切入点，才能引起共鸣。

For those who study Buddhism, whether in life or in cultivation, wisdom guidance can be found in the Dharma. The Dharma does not function merely as an overarching framework; it can permeate every situation. Understanding other schools of thought is mainly for the convenience of spreading the Dharma. Because beings have different capacities and inclinations, using content they are interested in as an entry point can strike a chord.

=== 信仰是自由的 / Faith Is Free <ch01-q06>

_问：_ 我家是信天主教的，原来我也自认为是天主教徒，但没参加正式仪式，也没有圣名。我现在皈依了，内心有点惴惴不安，如何排解这种感觉？

_Q:_ My family is Catholic, and I used to consider myself Catholic too, but I never took part in a formal ceremony and do not have a saint's name. Now I have taken refuge in Buddhism, and I feel a little uneasy. How can I resolve this feeling?

_答：_ 信仰是自由的，可以选择什么，也可以不选择什么。在成长过程中，随着眼界的开阔，我们的认识也在提高。如果觉得佛法智慧更究竟而作出新的选择，这很正常。更何况，你只是因为家庭原因默认自己是天主教徒，并不是主动选择，这种默认本身就没什么约束力。即使是自己的选择，也可以改变。在佛教戒律中，出家后如果不想再过修行生活，都可以正常还俗，所以不必有什么不安。

_A:_ Faith is free: you may choose a faith, or choose none. As we grow, our understanding grows as our horizons broaden.

关键是，你确实要认识到佛法的殊胜，认识到这种智慧可以解决人生困惑，认识到佛法僧三宝可以作为尽未来际的依止，是思考后的理智选择，而不只是凭着某种感觉皈依了，那就容易患得患失。你会感到不安，说明学得不够深入，要加强学习。

The key is that you must truly recognize the excellence of the Dharma, recognize that this wisdom can resolve the puzzles of life, and recognize that the Three Jewels of Buddha, Dharma, and Sangha can serve as a reliance throughout all future time. It should be a rational choice after reflection, not merely taking refuge on the basis of some feeling, which leaves one always anxious about gain and loss. Your feeling uneasy shows that your study has not been deep enough; you should strengthen your study.

=== 带着问题来选择 / Choose by Bringing Your Questions <ch01-q07>

_问：_ 我之前在美国留学十年，接触基督教的时间比较多。回国后在母亲引导下，看了济群法师的《百法明门论》系列讲座。现在母亲每天给我发佛教经典，阿姨给我发基督教的《圣经》。我深知脚踏两条船是错误的，但不知如何选择，非常困惑。

_Q:_ I studied in the United States for ten years and had quite a lot of contact with Christianity. After returning to China, under my mother's guidance, I watched Master Jiqun's lecture series on the _Treatise on the Gateway to Understanding the Hundred Dharmas_. Now my mother sends me Buddhist scriptures every day, and my aunt sends me the Christian Bible. I know full well that trying to walk two paths is wrong, but I do not know how to choose, and I am very confused.

_答：_ 如果一方面学着佛法，一方面看着基督教教义，却分不清哪种道理更有价值，更能说服自己，说明你还没有能力判断------佛法到底好在哪里。在这样的情况下，两种学习可能对你都重要，只好继续学。学到哪一天，你确定什么更究竟，才能作出选择。

_A:_ If on the one hand you are studying the Dharma while on the other hand you are reading Christian doctrine, yet you cannot tell which teaching is more valuable or more convincing to you, this shows you do not yet have the ability to judge where the excellence of the Dharma actually lies. In such a situation, both kinds of study may be important for you; you just have to continue studying. Only when one day you determine which is more complete can you make a choice.

但也可能，时间一天天过去，你却在"选择困难症”中陷得越来越深，越来越难以选择。所以还是要有方法，确定自己的诉求是什么，需要解决的是什么。然后带着问题考量，哪种教义对自己更有帮助，对生命和世界的解读更圆满。

But it is also possible that as the days pass, you will sink deeper and deeper into "decision paralysis" and find it harder and harder to choose. So you still need a method: determine what you are seeking and what you need to resolve. Then examine with these questions in mind which teaching is more helpful to you and offers a more complete interpretation of life and the world.

=== 信佛后能否去其他宗教场所 / Can One Go to Other Religious Sites After Believing in Buddhism? <ch01-q08>

_问：_ 我是回族，应该信伊斯兰教，但佛缘比较深，非常认可佛法智慧并皈依了。但因为民族身份，有时需要去清真寺参加活动，会不会有冲突？另一个问题是，佛教这么好，但现在真正皈依的人总体较少，这是为什么？

_Q:_ I am Hui, and I should believe in Islam, but my karmic affinity with Buddhism is deep, and I deeply appreciate the wisdom of the Dharma and have taken refuge. But because of my ethnic identity, I sometimes need to attend activities at the mosque. Will there be a conflict? Another question is, Buddhism is so good, yet the total number of people who truly take refuge is rather small now. Why is this?

_答：_ 从信仰层面来说，不可以同时皈依多种宗教。如果你皈依三宝，选择佛教，就意味着放弃对伊斯兰教或其他宗教的信仰。同样，如果你选择其他信仰，就意味着放弃了佛弟子的身份。信仰是人生归宿，就像你要去两个地方，目标不同，道路不同，无法既去这里，又去那里。但如果你只是去清真寺参加本民族的民俗活动，属于生活层面的，应该问题不大。

_A:_ In terms of faith, we cannot take refuge in multiple religions at the same time. If you take refuge in the Three Jewels and choose Buddhism, this means giving up faith in Islam or other religions. Likewise, if you choose another faith, it means giving up the identity of a Buddhist disciple. Faith is the destination of life; it is like wanting to go to two places with different goals and different roads—you cannot go to both. But if you are only going to the mosque to participate in the folk customs of your own ethnic group, this is a matter of daily life and should not be a big problem.

至于第二个问题，现在是一个信仰缺失的时代，原因很多，和十年浩劫有关，和长期以来的教育有关，也和教界的弘法薄弱有关。现在政府开始重视传统文化，为建设精神文明服务。我们也在不断探索，希望找到契合当代的传播方式。这需要大家共同努力，因为我们面对的是整个社会，不能仅仅靠几个人来做。

As for the second question, the present is an age of loss of faith; there are many reasons. It is related to the decade of catastrophe, to long-standing education, and also to weakness in the Buddhist community's efforts to spread the Dharma. The government is now beginning to value traditional culture to help build spiritual civilization. We are also continuously exploring, hoping to find ways to spread the Dharma suited to the contemporary era. This requires the joint effort of everyone, because we are facing the whole society; it cannot rely on just a few people.

=== 想出家该怎么做 / What to Do If You Want to Become a Monastic <ch01-q09>

_问：_ 出家需要什么机缘？到了寺院就能出家吗？

_Q:_ What conditions are needed to become a monastic? Can you become a monastic as soon as you arrive at a temple?

_答：_ 从自身来说，要对出家有正确认识。出家不仅是身份的改变，关键是内在的改变；不仅是出世俗家，更是出五蕴家，出生死家，出轮回家。这就必须认识到世俗生活的虚幻，学佛修行的意义，以追求解脱、走向觉醒作为唯一目标。这种发心才是出家正因。

_A:_ First, for yourself, you must have a correct understanding of becoming a monastic. Becoming a monastic is not only a change of identity; the key is inner change. It is not only leaving the worldly household, but even more leaving the household of the five aggregates, leaving the household of birth and death, leaving the household of samsara. This requires recognizing the illusory nature of worldly life and the meaning of learning and practicing Buddhism, and taking the pursuit of liberation and the path to awakening as the sole goal. Such an aspiration is the right cause for becoming a monastic.

从戒律来说，出家前要把世间各种责任处理好，以免日后受到干扰，或是给僧团带来各种问题。从寺院来说，要对发心出家者有半年以上的考核，觉得你真心修行，能适应并遵守道场的生活规范，才会安排剃度。其中，信心道念是最重要的，这是能否过好出家生活的保障。

In terms of precepts, before becoming a monastic you should settle your worldly responsibilities so as not to be disturbed later or bring problems to the Sangha. For the temple, there must be an evaluation of at least half a year for those who aspire to become monastics; only when the community feels you truly wish to cultivate, can adapt to monastic life, and will abide by the rules of the monastery will it arrange ordination. Among these, faith and determination are the most important; they determine whether one can live the monastic life well.

=== 以建寺造像开发旅游如法吗 / Is Building Temples and Statues for Tourism Development in Accordance with the Dharma? <ch01-q10>

_问：_ 现在很多地方把建寺造像作为开发旅游的项目，这么做是否如法？怎么看待这些现象？

_Q:_ Nowadays many places treat building temples and making statues as tourism development projects. Is this in accordance with the Dharma? How should we view these phenomena?

_答：_ 现在确实有地区为了发展经济、带动旅游而建寺造像，从佛教来说，这样做显然是不如法的。一个道场的存在，关键在于法的内涵，这样才能起到净化社会人心的作用，否则就和旅游景点没有本质区别了。遗憾的是，现在很多寺院也热衷于旅游开发，这和社会的大环境有关，也和教界缺乏良好的修学氛围有关。

_A:_ Some regions now build temples and make statues in order to develop the economy and promote tourism. In Buddhist terms, this is obviously not in accordance with the Dharma. The existence of a practice place depends on its Dharma content; only thus can it serve to purify the minds of people in society. Otherwise it is essentially no different from a tourist attraction. Regrettably, many temples are now also eagerly pursuing tourism development; this is related to the general social environment and also to the lack of a good atmosphere of study and practice in the Buddhist community.

我觉得，教界呈现一种什么状态，和众生的共业密切相关。如果众生恶业较重，就不易感得清净道场及大善知识的出现。所以我们不要过多责怪环境，也要考量自己：为什么生在这样的时代？由此策励自己精进修学。

I believe that the state presented by the Buddhist community is closely related to the collective karma of beings. If beings' negative karma is heavy, it is not easy to attract the appearance of pure practice places and great teachers. Therefore we should not blame the environment too much, but also examine ourselves: Why were we born in such an age? This should spur us on to study and practice diligently.

作为学佛人来说，在顺应环境的同时，还要主动选择清净道场，选择堪为依止的善知识，主动调整自己的心行状态。在努力过程中，相信我们感得的外缘也会发生变化。

As learners of Buddhism, while adapting to the environment, we should also actively choose pure practice places, choose wise teachers who are worthy of reliance, and actively adjust our own mental states and conduct. As we make effort, I believe that the external conditions we attract will also change.

== 二、忆念三宝 / II. Recollecting the Three Jewels <ch02>

=== 唤醒自性佛 / Awaken the Buddha Within <ch02-q01>

_问：_ 我们的本师是释迦牟尼佛，此外还有十方三世一切诸佛，为什么学佛人见面招呼时只说"阿弥陀佛”？其中有什么寓意？

_Q:_ Shakyamuni Buddha is our original teacher, and there are also all Buddhas of the ten directions and three times. Why do Buddhist practitioners greet one another by saying "Amitabha Buddha"? What is the meaning behind this?

_答：_ 这主要和净土宗的盛行有关。净土法门以信愿行作为修行资粮，即深信弥陀愿力，发愿往生西方。若能至诚称念弥陀名号，一心不乱，临终时就能蒙佛接引。对很多信众来说，这是一种容易听懂、接受并付诸实践的法门，历来就有广泛的信仰基础。只要是中国人，不论是否信佛，多少听说过"阿弥陀佛”和"西方极乐世界”，可见其流传之盛。相对其他净土，阿弥陀佛以四十八大愿创造的清净佛国更容易"移民”，这也是释迦牟尼佛为娑婆众生介绍的理想去处。

_A:_ This is mainly related to the prevalence of the Pure Land school. The Pure Land method takes faith, aspiration, and practice as its resources for cultivation: deep faith in Amitabha's vow power, and the aspiration to be reborn in the West. If we can sincerely recite Amitabha's name with single-minded concentration, we will receive the Buddha's guidance at the time of death. For many practitioners, this is a method that is easy to understand, accept, and put into practice, and it has always had a broad base of faith. Almost every Chinese person, whether Buddhist or not, has at least heard of "Amitabha Buddha" and the "Western Pure Land of Ultimate Bliss," which shows how widely it has spread. Compared with other pure lands, the pure Buddha land created by Amitabha through his forty-eight great vows is easier to "immigrate to," and this is also the ideal destination that Shakyamuni Buddha introduced for sentient beings of the Saha world.

称念"阿弥陀佛”的修行意义还在于，提醒我们忆念佛菩萨功德，念兹在兹，见贤思齐。"阿弥陀佛”意为无量光、无量寿，象征无量的慈悲和智慧。我们称念佛号，不仅要忆念西方的阿弥陀佛，更要唤醒自性弥陀、内在觉性。这样的信仰更直接，也更有深度。

The practice of reciting "Amitabha Buddha" also reminds us to recollect the merits of the Buddhas and bodhisattvas, to keep them constantly in mind, and to aspire to their example. "Amitabha" means infinite light and infinite life, symbolizing boundless compassion and wisdom. When we recite the Buddha's name, we should not only recollect Amitabha in the Western Pure Land, but also awaken the Amitabha within our own nature—our intrinsic awakened nature. Such faith is more direct and more profound.

=== 如何让念佛得力 / How to Make Buddha-Recitation Effective <ch02-q02>

_问：_ 我以前修念佛法门，参加三级修学后感觉不错，希望以前的道友一起来学，他们说只要信愿行，就可以凭借弥陀愿力往生极乐，是这样吗？

_Q:_ I used to practice the Pure Land method of Buddha-recitation. After joining the Three-Stage Practice, I have found it very beneficial, and I hope my former Dharma friends will study it with me. They say that as long as one has faith, aspiration, and practice, one can rely on Amitabha's vow power to be reborn in the Blissful Pure Land. Is this so?

_答：_ 念阿弥陀佛的人很多，但念得相应的并不多。怎么念才能得力？净土宗的修行看似简单，抱定一句佛号即可。但你能不能对极乐世界生起真切信心？愿生西方的愿有多强烈？事实上，要把这句佛号念得有力量，必须有相应的见地，而不只是简单地念着。所以天台、华严、禅宗的祖师在念佛时，会把本宗见地带入这一修行，所谓"教宗天台、行归净土”"有禅有净土，犹如带角虎”，都是为修习净土法门提供支持。如果见地不能提高，虽然嘴上在念佛，但生活中依然带着错误观念处理问题，制造烦恼。事实上，这样的现象比比皆是。当修行不能用来对治现前烦恼，能解决生死大事吗？

_A:_ Many people recite Amitabha Buddha's name, but not many do so in a way that truly connects. How should we recite to make it effective? Pure Land practice may seem simple—just hold fast to one Buddha name. But can you give rise to genuine confidence in the Pure Land? How strong is your aspiration to be reborn there? To make this recitation powerful, you need the corresponding insight; it is not enough simply to repeat the words. That is why the patriarchs of the Tiantai, Huayan, and Chan schools brought their own schools' insights into Buddha-recitation. The sayings "teachings based on Tiantai, practice returning to Pure Land" and "with both Chan and Pure Land, like a tiger with horns" all serve to support the practice of the Pure Land method. If your insight does not improve, then although your mouth may be reciting the Buddha's name, in daily life you will still handle problems with mistaken views and create afflictions. In fact, such cases are everywhere. If your practice cannot be used to counter the afflictions right before you, how can it resolve the great matter of birth and death?

三级修学的目的，是为大家提供有次第的完整引导。现在很多人修行，念佛也好，参禅也好，只是把它当作一个点，以为做好这点就可以。其实这个点能产生作用，是来自修行体系的共同发力。就像火箭之所以能上天，是需要基地和发射系统的。有了三级修学的基础，明确修行理路，今后不论修什么法门都容易得力。

The purpose of the Three-Stage Practice is to provide everyone with a complete, graduated guidance. Nowadays many people practice—whether reciting the Buddha's name or investigating Chan—treating it as a single point and thinking that doing this one thing well is enough. The power of that point comes from the combined strength of the entire practice system. Just as a rocket can reach the sky only with a launch base and propulsion system, so too, with the foundation of the Three-Stage Practice and a clear understanding of the path of practice, whatever method you cultivate in the future will more easily become effective.

=== 净念怎么相继 / How to Maintain Pure Mindfulness <ch02-q03>

_问：_ 《大势至菩萨念佛圆通章》中提到"都摄六根，净念相继”的念佛方法，是不是念佛要不管不顾、一刻不停地念下去？

_Q:_ The Surangama Sutra section on Buddha-recitation spoken by Mahasthamaprapta mentions the method of "gathering in the six sense faculties so that pure recitation continues in succession." Does this mean we should recite the Buddha's name recklessly, without stopping for a single moment?

_答：_ 都摄六根，不是说要把眼睛闭起来，把耳朵塞起来，关键是在于培养正念。比如念佛前要思维轮回的痛苦，思维阿弥陀佛的功德，认识到唯有三宝才能救度我们。将心调整到位后，再专注于佛号，就能在内心形成强大的正念。这种正念一旦稳定，自然形成相续的作用。这不是要嘴巴不停地念，因为你还要吃饭，还要睡觉，怎么相续？所以相续的是正念，是心与弥陀的相应。当然，在正念尚未形成之前，确实不容易做到净念相继。因为心念是无常的，时有时无，时断时续，需要通过长时间的训练。

_A:_ Gathering in the six sense faculties does not mean closing your eyes or plugging your ears. The key is to cultivate right mindfulness. For example, before reciting the Buddha's name, reflect on the suffering of samsara and on the merits of Amitabha Buddha, and recognize that only the Three Jewels can save us. Once the mind is properly adjusted, focus on the Buddha's name, and a powerful right mindfulness will take shape within. Once this right mindfulness becomes stable, it naturally continues in an unbroken stream. This is not about keeping the mouth reciting constantly—you still have to eat and sleep, so how could it continue without pause? What continues is right mindfulness, the resonance between mind and Amitabha. Of course, before right mindfulness has taken shape, it is not easy to achieve uninterrupted pure recitation, because the mind is impermanent: now present, now absent, now continuous, now broken. It requires long training.

=== 忆佛念佛，能不能见佛 / Can One See the Buddha by Recollecting and Reciting? <ch02-q04>

_问：_ 《大势至菩萨念佛圆通章》说："忆佛念佛，现前当来，必定见佛，去佛不远。”《阿弥陀经》也说，如果持名念佛，一心不乱，"其人临命终时，阿弥陀佛与诸圣众现在其前。”但佛陀在《金刚经》又说："若以色见我，以音声求我，是人行邪道，不能见如来。”念佛就是以音声向佛祈求，最后见到佛，为什么《金刚经》又说不能见呢？

_Q:_ The Surangama Sutra section on Buddha-recitation says, "When one recollects the Buddha and recites the Buddha's name, in the present and in the future one will surely see the Buddha and be not far from the Buddha." The Amitabha Sutra also says that if one holds the name with single-minded concentration, "at the time of that person's death, Amitabha Buddha and the holy assembly will appear before him." But the Buddha says in the Diamond Sutra, "If someone sees me in form or seeks me in sound, that person is practicing a wrong path and cannot see the Tathagata." Buddha-recitation uses sound to seek the Buddha, and in the end one sees the Buddha. Why does the Diamond Sutra say one cannot see the Buddha?

_答：_ 这是因为不同法门，在修行的不同阶段，会有不同定位。《圆通章》和《弥陀经》所见的是报身佛，通过忆佛念佛，见到弥陀前来接引。而《金刚经》所说的是法身佛，见到的是空性，所以"若见诸相非相，即见如来”。空性是无相的，必须超越对相的执著，才能见到如来。这些经典所说的佛是不一样的，并不矛盾。

_A:_ Different methods, at different stages of practice, have different orientations. What is seen in the Surangama section and the Amitabha Sutra is the enjoyment body of the Buddha; through recollecting and reciting the Buddha, we see Amitabha coming to welcome us. What the Diamond Sutra speaks of is the Dharma body of the Buddha; what is seen is emptiness, so "if one sees that all forms are not forms, one sees the Tathagata." Emptiness is formless; we must transcend attachment to forms in order to see the Tathagata. The Buddhas spoken of in these sutras are not the same, and there is no contradiction.

=== 佛有寿命吗 / Does the Buddha Have a Lifespan? <ch02-q05>

_问：_ 《地藏经》说："彼佛寿命四百千万亿阿僧祇劫。”佛不是永恒的状态吗？为什么还有寿命呢？

_Q:_ The Earth Store Sutra says, "That Buddha's lifespan is four hundred thousand million asamkhyeya kalpas." Is not the Buddha an eternal state? Why would the Buddha still have a lifespan?

_答：_ 佛有三种身，为法身、报身、应化身。法身是无相的，以空性为身，所以不生不灭；报身是由佛陀的智慧和功德所成；化身是随众生需要，在不同时空示现的身相。比如释迦牟尼佛2500多年前来到娑婆世界，在蓝毗尼降生，然后出家、成道、弘法，世寿80岁时在拘尸那城娑罗双树林入灭。这是应化身的示现，随着众生的业缘和福报，示现时间有长有短。所以不生不灭和有生有灭并不矛盾，只是从不同层面而言。

_A:_ The Buddha has three bodies: the Dharma body, the enjoyment body, and the manifestation body. The Dharma body is formless; it takes emptiness as its body, and therefore is neither born nor perishes. The enjoyment body is formed from the Buddha's wisdom and merit. The manifestation body appears in various times and places according to the needs of sentient beings. For example, over 2,500 years ago Shakyamuni Buddha came to the Saha world, was born in Lumbini, then left home, attained awakening, and propagated the Dharma, and at the age of eighty entered nirvana in the sala grove at Kushinagar. This is the manifestation of the manifestation body; depending on the karmic conditions and merit of sentient beings, the duration of its appearance may be long or short. Therefore, "neither born nor perishes" and "born and perishes" are not contradictory; they simply refer to different levels.

=== 观修是为了强化信心 / Contemplative Practice Strengthens Faith <ch02-q06>

_问：_ 我念三皈依时，皈依佛会想到佛陀，皈依法会想到《金刚经》《心经》等佛典，皈依僧会观想法师，这样对吗？怎么观想更好？

_Q:_ When I recite the Three Refuges, taking refuge in the Buddha I think of the Buddha; taking refuge in the Dharma I think of scriptures such as the Diamond Sutra and the Heart Sutra; taking refuge in the Sangha I visualize the Dharma teacher. Is this right? How can I contemplate more effectively?

_答：_ 念诵三皈依，在修行的各个阶段，见地不同，观修也有所不同。在念诵时，可以让心专注地投入念诵并保持这一状态，声声入耳，而不是在各种观修对象中来回切换。也可以以佛陀名号为所缘，或以佛像为所缘，或直接认识无所得的心。至于哪种方式更适合，每个人可以根据自己的修行效果来选择。只要能体现三宝的内涵，能使我们强化对三宝的信心即可。在当下的修行阶段，什么观修起来清晰、稳定，就观修什么。

_A:_ In reciting the Three Refuges, at different stages of practice and with different levels of insight, contemplative practice also differs. While reciting, you can let the mind be fully absorbed in the recitation and maintain that state, with every sound entering the ears, rather than switching back and forth among various objects of contemplation. You may also take the Buddha's name as your object, or a Buddha image, or directly recognize the mind of non-attainment. As to which method is more suitable, each person can choose according to its effect in their own practice. As long as it expresses the meaning of the Three Jewels and strengthens our faith in them, it is enough. At your present stage of practice, contemplate whatever is clear and stable for you.

== 三、以戒为师 / III. Taking the Precepts as Teacher <ch03>

=== 没有谁管谁的管理 / Management Without Someone Managing Others <ch03-q01>

_问：_ 世间团体是以利益维系的，但菩提书院是纯公益组织，大家都是义工，您是怎么管理的？有什么善巧方便？

_Q:_ In worldly organizations people are held together by interests, but the Bodhi Institute is a purely public-interest organization, and everyone is a volunteer. How do you manage it? What skillful means are there?

_答：_ 书院是传承佛教文化、传播佛法智慧的平台，重点是施设一套课程，建立模式化、标准化的修学方式。这也符合佛教传统的管理方式。释迦牟尼入灭时，没有找谁当僧团领袖，而是告诫弟子们"以法为师，以戒为师”。法是佛法智慧和修行理路，戒则是个人行为规范和僧团管理规则。这种管理不是谁管谁，而是共同生活需要遵守的原则。不论四个人的团体，还是四百人的团体，在戒律中都是平等的。所以僧团之间是扁平化的，不是集权制，也没有上下级的关系。关于修行、生活、共住的所有问题，戒律中有一套羯磨作法，大家就按这个规范执行。每个出家人进入僧团后都要学戒，了解每件事的规则和处理模式，同时遵循六和的精神和合共住。

_A:_ The Institute is a platform for transmitting Buddhist culture and spreading the wisdom of the Dharma. The focus is on setting up a curriculum and establishing a structured, standardized way of study and practice. This also accords with the traditional Buddhist way of managing. When Shakyamuni Buddha entered parinirvana, he did not appoint anyone as leader of the Sangha; instead, he admonished his disciples, "Take the Dharma as your teacher, take the precepts as your teacher." The Dharma is the wisdom of the Buddhadharma and the path of cultivation; the precepts are the norms of personal conduct and the rules for managing the Sangha. This kind of management is not a matter of someone controlling others, but principles that communal life needs to observe. Whether a group has four people or four hundred, all are equal before the precepts. Thus the Sangha is flat in structure, not centralized, and has no hierarchical relationships. For all matters concerning cultivation, daily life, and communal living, the precepts provide a set of kamma procedures; everyone simply follows these norms. Every monastic who enters the Sangha must study the precepts, understand the rules and procedures for each matter, and at the same time follow the spirit of the six harmonies and live together in accord.

书院也是同样，我们不是在做一个团体，而是成就大家在这个平台共同修学。当他们于法受益后，就会继续帮助他人修学，因为利他是提升自己的最好途径。所以我们需要的不是行政管理，更不是世间利益，而是建立一套规范，帮助大家尽快走上修学轨道。

The Institute is the same. We are not building an organization; we are enabling everyone to study and practice together on this platform. When they benefit from the Dharma, they will continue to help others study and practice, because benefiting others is the best way to improve oneself. So what we need is not administrative management, much less worldly benefit, but to establish a set of norms that help everyone get onto the track of study and practice as quickly as possible.

=== 持戒困难怎么办 / What to Do When Keeping Precepts Is Difficult <ch03-q02>

_问：_ 在家人普遍感觉持戒困难，怎样解决这个问题？

_Q:_ Lay practitioners generally feel that keeping the precepts is difficult. How can this problem be solved?

_答：_ 佛法中，将戒称为无上菩提本，是长养善根、迈向解脱的基础。在不少人的观念中，戒律似乎很神秘、很刻板，这是因为对戒律无知造成的误解。事实上，戒律是帮助我们建立一种真善美的生活。所谓真，是追求真理；所谓善，是完善道德；所谓美，是庄严身心。

_A:_ In the Buddhadharma, the precepts are called the foundation of unsurpassed bodhi and the basis for nurturing wholesome roots and advancing toward liberation. Many people see the precepts as mysterious and rigid; this misunderstanding comes from ignorance of the precepts. In fact, the precepts help us establish a life of truth, goodness, and beauty. Truth means pursuing truth; goodness means perfecting morality; beauty means dignifying body and mind.

我们现有生命是无明制造的产品，是混乱无序的。受持戒律，是对种种不良习惯的修正，势必会和原有串习产生冲突。这种冲突使凡夫心感到压抑，也使我们不愿持戒，并寻找种种自我保护的理由。但要知道，如果我们想改善生命，就必须扭转这些不良串习。修行，是通过对观念和行为的修正，最终修正心态，修正人格，修正生命品质。在此过程中，戒律是必不可少的重要保障。

Our present life is a product of ignorance, chaotic and disorderly. Receiving and upholding the precepts is a correction of all kinds of unwholesome habits, and it is bound to conflict with our existing patterns. This conflict makes the mind of an ordinary being feel repressed, makes us unwilling to keep the precepts, and leads us to find all sorts of reasons to protect ourselves. But we should know that if we want to improve our lives, we must reverse these unwholesome patterns. Cultivation transforms our mental states, character, and the quality of life by correcting our views and behavior. In this process, the precepts are an indispensable and important safeguard.

真正认识到戒律对自身的意义，持戒就不再是被动的约束，而会成为我们主动的选择。学生学习是辛苦的，运动员训练是辛苦的，在社会上工作也是辛苦的，但没人因为辛苦而放弃，为什么？正是因为他们认识到学习、训练和工作的重要性。持戒同样如此，明了持戒的意义，即使暂时遇到困难，也不会成为阻碍。

When we truly recognize the meaning of the precepts for ourselves, keeping them is no longer a passive restraint but becomes our active choice. Students study hard, athletes train hard, and working in society is also hard, yet no one gives up because it is hard. Why? It is precisely because they recognize the importance of study, training, and work. Keeping the precepts is the same. Once we understand their meaning, temporary difficulties will not become obstacles.

=== 游戏中的杀会不会犯戒 / Does Killing in Video Games Break the Precept? <ch03-q03>

_问：_ 有人说，网络游戏中的杀人行为也是犯了杀戒，要堕入地狱，是这样吗？

_Q:_ Some say that killing in online video games also breaks the precept against killing and causes one to fall into hell. Is this so?

_答：_ 两者是不一样的。但要看到，游戏中的杀人行为虽然不等于实际杀人，但会增长杀心，成为未来造下杀业的因，所以玩这种游戏显然是不利于身心健康的。比如在游戏中杀人成了习惯，可能在现实中也觉得这不是什么大事，不计后果地做了。事实上，确实有青少年因为沉迷游戏，结果在生活中犯罪。这是必须特别警惕的。不论在什么情况下，也不论面对什么对象，都不应该让自己起杀心，动杀念。至于是否犯戒，是有相关标准的。比如杀生，必须以恶心故意杀害有情，也确实让对方丧命。从这点来说，不能算是犯了杀戒。

_A:_ The two are not the same. But we should see that although killing in games is not the same as actual killing, it increases the intention to kill and becomes a cause for future killing karma, so playing such games is clearly harmful to body and mind. For example, if killing in games becomes habitual, we may also think it is no big deal in real life and act without considering the consequences. There really are young people who, because of obsession with games, end up committing crimes in life. This is something we must be especially vigilant about. No matter what the situation or what the object, we should not allow ourselves to give rise to the intention or thought of killing. As for whether the precept is broken, there are relevant criteria. For example, killing requires that one deliberately kill a sentient being with a harmful mind and that the victim actually loses life. From this point of view, it cannot be considered breaking the precept against killing.

=== 受戒后可以参战吗 / Can One Fight in a War After Receiving Precepts? <ch03-q04>

_问：_ 如果现在发生战争，作为已经受了五戒的人，可以参战吗？佛教中有没有以这种方式教化众生？

_Q:_ If war broke out now, as someone who has received the Five Precepts, could we participate? Does Buddhism teach sentient beings in this way?

_答：_ 佛教有声闻戒和菩萨戒，两者的定位和要求不同。声闻戒绝对禁止杀生，不论什么情况，只要杀了就是犯戒。但在菩萨戒中，如果遇到特殊情况，对此是有开缘的。比如菩萨看到歹徒要杀死很多人，想到他会因此造下重大罪业，堕入恶道，宁愿自己承担杀他的果报。这么做，既是为了慈悲被害者，也是为了慈悲歹徒，不让他因杀人而堕落。所以菩萨的发心和侠客截然不同。侠客是嫉恶如仇，除暴安良，而菩萨是对双方平等慈悲，是本着"我不入地狱谁入地狱”的牺牲精神行事。只要有丝毫嗔恨心，就没资格开杀戒。战争的情况也是同样，如果你确实本着广大慈悲，希望侵略者少造杀业，同时也避免更多人受害，带着这样的发心参战，是不犯戒的。

_A:_ Buddhism has the shravaka precepts and the bodhisattva precepts; their orientation and requirements are different. The shravaka precepts absolutely forbid killing; no matter what the situation, killing breaks the precept. But in the bodhisattva precepts, if special circumstances arise, there is room for this. For example, if a bodhisattva sees a criminal about to kill many people and realizes that he will thereby create heavy karma and fall into the lower realms, the bodhisattva would rather personally undertake the karmic result of killing him. In doing so, the bodhisattva is compassionate toward both the victims and the criminal, preventing him from falling because of killing. Therefore the bodhisattva's resolve is completely different from that of a knight-errant. The knight-errant hates evil as an enemy and rids the people of oppressors, whereas the bodhisattva is equally compassionate toward both sides, acting with the spirit of sacrifice expressed in "If I do not go to hell, who will?" If there is even the slightest hatred, one is not qualified to open the precept against killing. The situation of war is the same. If you truly act from great compassion, hoping that the invaders will create less killing karma and that more people will be spared from harm, and participate with such a resolve, it does not break the precept.

=== 众生真的平等吗 / Are Sentient Beings Really Equal? <ch03-q05>

_问：_ 怎么理解众生平等？蚊子和我们是平等的吗？受戒后怎样对待老鼠之流？另外，清理环境时难免误伤小动物，这会犯戒吗？为什么要爱护它们？

_Q:_ How should we understand the equality of sentient beings? Are mosquitoes equal to us? After receiving the precepts, how should we deal with rats and the like? Also, when cleaning the environment we inevitably harm small creatures by accident—does this break the precept? Why should we cherish them?

_答：_ 众生是平等的，也是不平等的。所谓平等，是从佛性和业力角度来说。众生皆有佛性，造业皆会感果，在这个层面，众生是平等无别的。但生命在延续过程中会有不同积累，所以每个生命的起点各不相同。在六道众生中，人的身份最为可贵。因为只有这个身份才是解脱、成佛的法器，所以佛陀说人身难得，但没说蚊子难得。

_A:_ Sentient beings are equal and also not equal. Equality is spoken of in terms of Buddha-nature and karma. All sentient beings possess Buddha-nature, and whatever karma they create will bear fruit. At this level, sentient beings are equal without distinction. But in the course of the continuity of life, there are different accumulations, so the starting point of each life is not the same. Among the sentient beings of the six realms, the human state is most precious. Only this state is the vessel for liberation and buddhahood, so the Buddha said that human life is hard to obtain, not that mosquito life is hard to obtain.

对老鼠、蟑螂之类的处理，在戒律中也明确说到。首先是尽量搞好环境卫生，防止它们滋生。如果已经出现，要选择不伤害它们的方式来处理。如果搞卫生时无意伤害了小生命，虽然有罪业，但比较轻，且属不定业，受报时间和结果都不确定，但从戒律来说是不犯的。因为戒律是具缘成犯，无心造作的行为不在此列。

The handling of rats, cockroaches, and the like is also clearly addressed in the precepts. First, do your best to maintain environmental hygiene and prevent them from breeding. If they have already appeared, choose ways to deal with them that do not harm them. If, while cleaning, you unintentionally harm a small creature, although there is karmic offense, it is relatively light and of indefinite karma; the time and result of retribution are uncertain. But in terms of the precepts, it is not a violation. This is because the precepts require complete conditions for an offense; unintentional acts are not included.

爱护生命，既是给其他众生以安全感，也是为了长养我们的慈悲心。这不仅有益于众生，也有益于自身生命的改善。学佛不是为了获得某种身份，而是要学佛所行，圆满佛菩萨具备的悲智两大品质。爱护生命，正是成就慈悲品质的具体实践。

Cherishing life both gives other sentient beings a sense of security and nurtures our own compassion. This benefits not only sentient beings but also improves our own lives. Studying Buddhism is not for the sake of gaining a certain identity, but for learning what the Buddha did and perfecting the two qualities of compassion and wisdom that Buddhas and bodhisattvas possess. Cherishing life is precisely the concrete practice for fulfilling the quality of compassion.

=== 喜欢吃肉怎么治 / How to Overcome the Habit of Eating Meat <ch03-q06>

_问：_ 学佛后知道要不杀生，但我很喜欢吃肉，怎样克服这个嗜好？

_Q:_ After learning Buddhism I know that we should not kill, but I very much like eating meat. How can I overcome this preference?

_答：_ 不杀生，并不完全等同于吃素。佛陀开许吃三净肉，即不见、不闻、不疑。不见是没看见这个肉为你而杀，不闻是没听说这个肉为你而杀，不疑是没任何迹象表明这个肉为你而杀。这种三净肉是可以吃的。当然从慈悲的角度说，不吃是更好的，毕竟有人吃就会有人杀。

_A:_ Not killing is not the same as being vegetarian. The Buddha permitted the eating of the three kinds of pure meat: that which one has not seen, heard, or suspected to have been killed for oneself. "Not seen" means one did not see the animal killed for one's sake; "not heard" means one did not hear that it was killed for one's sake; "not suspected" means there is no sign that it was killed for one's sake. Such three kinds of pure meat may be eaten. Of course, in terms of compassion, not eating is better, because if people eat meat, others will kill for them.

如果对肉有贪著心，可以通过思维，从转变观念开始。其一，想到肉就是动物的尸体，尸体真的好吃吗？其二，想到"我肉众生肉，名殊体不殊”，你拿自己的手咬一口试试，看看如果自己被吃的话，痛不痛，怨不怨。为什么要为自己的口腹之欲伤害众生，和它们结下恶缘？其三，想到现在很多养殖方式很不健康，吃了对身体有极大危害。其四，想到发展养殖业带来了种种环境问题，比如对空气和水源的污染，以及种植饲料占用大量耕地，甚至为此砍伐森林。有关的资料非常多，具备这些认知，相信会减少对肉的贪著。

If you are attached to meat, you can begin by transforming your views through reflection. First, consider that meat is the corpse of an animal—is a corpse really delicious? Second, recall the saying, "My flesh and the flesh of sentient beings differ in name but not in substance." Try biting your own hand and see whether it hurts and whether you would resent it if you were being eaten. Why satisfy the cravings of your palate by harming sentient beings and creating bad karma with them? Third, consider that many modern farming methods are very unhealthy and eating meat can cause great harm to the body. Fourth, consider that the development of animal husbandry brings many environmental problems, such as pollution of the air and water and the use of large amounts of farmland to grow feed, even to the point of clearing forests for it. There is a great deal of information on these topics. With such understanding, your attachment to meat will surely decrease.

=== 做股票犯不犯盗戒 / Does Trading Stocks Break the Precept Against Stealing? <ch03-q07>

_问：_ 盗戒的界限在哪里？我已经受了五戒，如果从事股票、基金之类金融市场的运作，会不会犯盗戒？

_Q:_ Where is the boundary of the precept against stealing? I have already received the Five Precepts. If I engage in stock trading, funds, and other financial-market operations, will I break the precept against stealing?

_答：_ 偷盗也叫不与取，其标准为，凡是别人没有给你的有主物，都不可私自占为己有。哪怕带着想占有的心挪动位置，也是犯戒的。

_A:_ Stealing is also called taking what is not given. Its standard is that we must not take for ourselves anything owned by another that has not been given, even if one merely moves it with the intention to possess it.

做股票之类，只要在合法理财的范畴中规范操作，是道德和法律允许的，谈不上犯戒。不过同样是做股票，有投资式和投机式之分。如果是投资式的，就是集中大家的力量一起做事，可以相互增上，共同受益，应该算是自利利他的好事。但如果是投机式的，因为急功近利，多少会夹杂欺骗行为，甚至让他人受到伤害，那是不如法的。作为学佛者，应该避免这样的心态和行为。

Trading stocks and the like, as long as it is within the scope of lawful financial management and conducted according to regulation, is permitted by morality and law and cannot be called breaking the precept. However, stock trading can be either investing or speculating. If it is investing, it gathers everyone's strength to do something together, enabling mutual growth and shared benefit; this should be considered a good deed that benefits oneself and others. But if it is speculating, because of the eagerness for quick success, it will more or less involve deception and may even harm others; this is not in accord with the Dharma. As a Buddhist practitioner, one should avoid such attitudes and behavior.

=== 不妄语的界定 / Defining False Speech <ch03-q08>

_问：_ 我觉得对不妄语没有把握。比如以前朋友问我关于人生的问题，我会按自己的见解直说。但现在会想：自己还是凡夫，所说能否有益于他？如果说得不那么完善，是妄语吗？

_Q:_ I don't feel confident about the precept against false speech. In the past, when friends asked me about questions in life, I would speak straightforwardly according to my own views. But now I wonder: I am still an ordinary being—will what I say benefit them? If what I say is not quite complete, is it false speech?

_答：_ 如果这样来理解不妄语，很多时候就无法说话了。在成佛之前，我们的所说都不见得完善，只是程度不同而已。不妄语，是你明知这个东西是黑的，却把它说成白的；明知这件事是错的，却把它说成对的，纯粹是颠倒黑白，混淆是非。这么做的目的，或是为了得到对方的利益，或是看对方不爽，刻意欺骗他。

_A:_ If the precept against false speech were understood in that way, it would often be impossible to speak. Before attaining buddhahood, nothing we say is perfectly complete; there are only degrees of incompleteness. False speech means knowing that something is black yet calling it white, knowing that something is wrong yet calling it right—purely inverting black and white and confusing right and wrong. The purpose is either to gain some benefit from the other person or, because you dislike the person, to deliberately deceive him.

至于分享自己对人生和世界的理解，不论是对是错，或是不那么完善，确实是你当下的想法，就不属于妄语的范畴。当然，学佛人确实应该谨言慎行。首先要本着利他心说，其次不要为逞口舌之快而说。一行禅师对不妄语有这样的解读："明了语言可以创造幸福或制造痛苦，我发誓学习讲实语，讲能够激发人的自信、给人带来快乐和希望的话。我决心不传播不确定的消息、不批评或谴责我没有把握的事情，避免讲会导致分裂或不和的话，或会导致家庭、团体破裂的话。”不仅告诉我们不说什么，还告诉我们该说什么，是很好的修行提醒。

As for sharing your own understanding of life and the world, whether it is right or wrong or not quite complete, as long as it is genuinely your present thought, it does not fall within the scope of false speech. Of course, Buddhists should indeed be careful and cautious in speech. First, speak with the intention to benefit others; second, do not speak merely to show off. Thich Nhat Hanh offered this interpretation of the precept against false speech: "Aware that words can create happiness or suffering, I vow to learn to speak truthfully, to speak words that inspire confidence, joy, and hope. I am determined not to spread news whose truth I do not know, not to criticize or condemn things of which I am not sure, and to avoid words that cause division or discord, or that can break families or communities." This tells us not only what not to say but also what to say; it is a very good reminder for practice.

=== 怎么面对不如法的现象 / How to Face Improper Phenomena <ch03-q09>

_问：_ 和师兄们交流时，偶尔会说到其他法师和寺院的问题，会不会有谤僧之过？

_Q:_ When talking with Dharma friends, I occasionally speak about the problems of other Dharma teachers and temples. Is this the offense of slandering the Sangha?

_答：_ 在今天这个末法时代，从社会到教界都有很多问题，这和众生的共业有关。怎么看待这些现象？作为个人信仰来说，虽然皈依僧是皈依一切僧众，但佛陀告诉我们，要亲近善知识，依止善知识修学，除了能得到有效引导，也是对初学者的保护，避免接触不善的所缘。

_A:_ In this present Dharma-ending age, there are many problems in society and in the Buddhist world alike; this is related to the collective karma of sentient beings. How should we view these phenomena? As far as personal faith is concerned, although taking refuge in the Sangha means taking refuge in all monastics, the Buddha told us to draw near to wise teachers and to rely on them in our study and practice. Besides receiving effective guidance, this also protects beginners by keeping them away from unwholesome objects.

如果已经遇到不如法现象，当我们没能力改变时，远离即可，不必多说什么，更不要在背后议论。因为僧团内部的问题，你很难知晓全部情况，也不了解出家戒律，只是凭自己的观感在判断，可能会有偏差。妄加议论的话，不仅于事无补，对自己也没好处，往往是自寻烦恼，还会影响他人对三宝的信心。但如果确定对方是以此谋生的假僧尼，我们从护持佛法的角度，通过正当渠道加以纠正，也是有意义的。因为这种现象会让人断送慧命，给佛教带来不良影响。所以关键是看具体情况，看自己有能力做什么。

If you have already encountered an improper phenomenon, when you lack the ability to change it, simply keep your distance; there is no need to say much, and even less to discuss it behind others' backs. Problems within the Sangha are difficult for you to know fully, and you do not understand the monastic precepts; you are judging merely by your own impressions, which may be biased. Irresponsible discussion not only fails to help matters but also does you no good; it usually creates affliction for yourself and can affect others' faith in the Three Jewels. But if you are certain that the other party is a fake monastic who makes a living in this way, then from the perspective of protecting the Dharma it is meaningful to correct this through proper channels. Such a phenomenon can destroy people's wisdom-life and bring adverse effects to Buddhism. So the key is to look at the specific situation and at what you are capable of doing.

=== 持戒是看清现实后的自觉选择 / Keeping Precepts Is a Conscious Choice After Seeing Reality <ch03-q10>

_问：_ 学佛后，我在生活中尽力持戒，但感到有困难，很多同修也觉得这么做过于理想化，请法师开示。

_Q:_ After learning Buddhism, I do my best to keep the precepts in daily life, but I find it difficult, and many fellow practitioners also feel that this is overly idealistic. I ask the teacher for guidance.

_答：_ 戒律告诉我们"此应作此不应作”，这些行为规范是导向解脱的，确实会和原有串习产生冲突。因为凡夫的串习是贪嗔痴，会觉得持戒是束缚，不舒服。但如果我们想要改变生命品质，就必须纠正以往的不良心行。尤其是现代人，受个性解放的影响，以放纵、任性、我行我素为常态，格外缺乏自制力，必须刻意对治，否则是不可能改变的。

_A:_ The precepts tell us "this should be done, this should not be done." These norms of conduct lead to liberation, and they will indeed conflict with our existing patterns. Because the patterns of ordinary beings are greed, hatred, and delusion, they feel that keeping the precepts is restrictive and uncomfortable. But if we want to change the quality of our lives, we must correct our previous unwholesome mental conduct. Especially for modern people, influenced by the liberation of individuality, indulgence, willfulness, and acting as one pleases have become the norm; they especially lack self-control and must deliberately counter these tendencies, or change is impossible.

当我们认识到戒律对心行的保护，对改善生命的意义，持戒就会成为自觉的行为。因为我们不是在被动接受某种规约，而是为了完善自己寻求戒律的帮助。这么做并不是理想化，事实上，这是认清现实后的唯一选择。

When we recognize the precepts' protection of the mind and their meaning for improving our lives, keeping them becomes a conscious act. Because we are not passively accepting some regulation, but seeking the help of the precepts in order to perfect ourselves. This is not idealism; it is the only choice after seeing reality clearly.

=== 罪业也是缘起法 / Karmic Offenses Are Also Conditioned Phenomena <ch03-q11>

_问：_ 我之前堕过胎，学佛后很后悔，也为此超度过，但内心还是忐忑，忏悔有用吗?

_Q:_ I had an abortion before. After learning Buddhism I deeply regret it and have performed deliverance rituals for it, but I still feel uneasy. Is confession effective?

_答：_ 人非圣贤，孰能无过。在无尽轮回中，我们因为贪嗔痴造下种种罪业，学佛后认识到往昔行为的错误，就不会一如既往地继续犯错，使不善业日益增长。所以调整观念特别重要，这是不再犯错的保障。你既然已经认识到错误，本身就是进步，但不必过于纠结。因为心理负担本身不是正向情绪，既不能解决问题，对生活、修行也没有帮助。

_A:_ To err is human. In the endless round of rebirth, because of greed, hatred, and delusion we have created all kinds of karmic offenses. After learning Buddhism, once we recognize the errors of our past actions, we will not continue to make mistakes as before and cause unwholesome karma to grow day by day. Therefore, adjusting our views is especially important; this is the guarantee against further error. Since you have already recognized your mistake, that itself is progress, but you need not be overly entangled. Because psychological burden is not a positive emotion; it can neither solve the problem nor help life or cultivation.

对已经造下的恶业，可以通过忏悔、超度来对治。《瑜伽师地论》中说到四力忏悔，即破坏现行的拔除力、对治现行的对治力、遮止罪恶的防护力、依止三宝而获得的依止力，都可以净治罪障。从佛法角度说，罪业也是缘起法，既然可以积累，同样可以消除。关键是从今往后具足正见，断恶修善。

For karmic offenses already created, confession and deliverance can be used as remedies. The _Yogacarabhumi Shastra_ speaks of confession through four powers: the power of eradication, which destroys present conduct; the power of remedy, which counteracts present conduct; the power of protection, which restrains evil; and the power of reliance, which is obtained by taking refuge in the Three Jewels. All of these can purify karmic obstructions. From the perspective of the Dharma, karmic offenses are also conditioned phenomena; since they can be accumulated, they can also be eliminated. The key is from now on to possess right view, abandon evil, and cultivate goodness.

== 四、态度方法 / IV. Attitudes and Methods <ch04>

=== 策励精进的善因缘 / Favorable Conditions That Spur Vigorous Effort <ch04-q01>

_问：_ 人生走到现在，对佛法所说的苦、空、无常有充分体会。我参加三级修学半年，每次分享都泪流满面，深知唯有佛法能救自己。我也发心承担义工行，给生活做减法，留出更多时间学法，但即使这样，修学态度还是有点吊儿郎当，总以不执著为借口。为什么我就不能勇猛精进呢？

_Q:_ Having come this far in life, I have a deep appreciation of the Dharma's teachings on suffering, emptiness, and impermanence. I have been in the Three-Stage Practice program for half a year, and I weep every time I share, knowing only the Dharma can save me. I have also aspired to serve as a volunteer, simplifying my life to free up more time for Dharma study. Yet even so, my attitude toward practice remains rather casual, always using "non-attachment" as an excuse. Why can't I practice with courage and diligence?

_答：_ 在修行路上，我们虽然看到了觉醒的价值，但同时还有无所不在的串习，而从外部环境看，整个社会都在支持贪嗔痴。面对这样的内外夹攻，必须不断斗争，为修学创造善缘。你现在所处的胶着状态，是不少人会经历的。如果不突破，就会随波逐流，失去向道之心。

_A:_ On the path of practice, although we have seen the value of awakening, we are still surrounded by habitual tendencies, and from the external environment, the whole of society supports greed, hatred, and delusion. Faced with this pressure from within and without, we must keep struggling and create favorable conditions for our practice. The stalemate you are in now is something many people experience. If you do not break through it, you will be swept along by the current and lose your aspiration for the Path.

关于精进，佛法的提醒方式是思维暇满人身的义大难得，还有念死无常、念三恶道苦等。有一篇《心匙》，对如何念死有发人深省的描述，经常听一听，随文入观，可以策励精进。此外还要学会管理时间，把每天的修学安排固定下来，以免晃晃悠悠，被惯性带着跑。三级修学重视氛围，有一群伙伴相互鼓励，也是修学的重要保障。但最关键的是有效修学，于法受益，这种法喜本身就是源源不断的动力。有句话叫兴趣是最好的老师，其实学佛也是同样，要激发并保持对法的好乐。随着正念不断增长，就能战胜串习。

Regarding diligence, the Dharma reminds us to reflect on the great value and rarity of this precious human life, as well as on death and impermanence and the sufferings of the three lower realms. There is a piece called _Key to the Mind_ that offers a sobering description of how to contemplate death; listening to it often and entering into contemplation as you follow the text can spur you to diligent practice. In addition, you need to learn to manage your time, setting a fixed schedule for daily practice so that you do not drift along, carried by inertia. The Three-Stage Practice emphasizes atmosphere; having a group of fellow practitioners who encourage one another is also an important safeguard. But the most crucial thing is effective practice that brings real benefit from the Dharma; this Dharma joy itself is an inexhaustible source of motivation. There is a saying that interest is the best teacher; the same is true in learning Buddhism---we must arouse and sustain a genuine love for the Dharma. As right mindfulness keeps growing, you will be able to overcome habitual tendencies.

=== 发愿要具体吗 / Should Aspirations Be Specific? <ch04-q02>

_问：_ 怎样发起愿菩提心？我觉得发愿的偈颂有些笼统，是否要有具体的愿望？此外，应该怎么观修？

_Q:_ How do we arouse the bodhicitta of aspiration? I feel that the verses for making aspirations are somewhat general; should we have more specific wishes? Moreover, how should we practice contemplation?

_答：_ 愿菩提心代表人生最为崇高的愿望------以成就无上菩提、帮助一切众生解除轮回痛苦为目标。因为它是终极目标，自然是笼统的。为了便于操作，个人可参照诸佛菩萨的发愿，如阿弥陀佛的四十八愿、药师佛的十二大愿、普贤菩萨的十大行愿，并结合自身情况制定更为具体的愿望。发愿能否具足力量，关键在于这一愿望是否真切。唯有发自内心的愿望，才能在生命中产生作用，成为推动我们前行的力量。如果仅仅停留于口头，是不可能产生多少效果的。

_A:_ The bodhicitta of aspiration represents the most sublime wish in human life: to attain unsurpassed bodhi and help all sentient beings be freed from the sufferings of samsara. Because it is the ultimate goal, it is naturally general. To make it workable, you can take inspiration from the vows made by Buddhas and bodhisattvas---such as Amitabha Buddha's forty-eight vows, Medicine Buddha's twelve great vows, and Samantabhadra's ten great vows---and formulate more specific wishes in light of your own situation. Whether an aspiration has power depends on whether it is genuine. Only a wish that comes from the heart can take effect in your life and become a force that propels you forward. If it remains no more than words, it cannot produce much effect.

观修是闻法、思维后，对法义的进一步落实。如思维暇满义大、念死无常、念三恶道苦，都要通过观察修和安住修轮番进行。当所观境生起时，就可安住其中。当所观境开始模糊，又需要继续观察，直到境界清晰。通过这样的修习，对所学法义生起定解。关于此，我在《略论》系列讲座中有较为详细的说明。若能仔细听下来，就清楚怎么修了。

Contemplative practice is the further application of the Dharma after hearing and reflecting upon it. For example, reflecting on the great value and rarity of this precious human life, contemplating death and impermanence, and contemplating the sufferings of the three lower realms should all be done through the alternation of analytical meditation and settling meditation. When the object of contemplation arises, you can rest in it. When it begins to fade, you need to analyze again until the experience becomes clear. Through such practice, you will develop certainty about the Dharma you have studied. I have explained this in some detail in the _Lamrim_ lecture series. If you listen carefully, you will understand how to practice.

=== 学以致用才是真进步 / True Progress Lies in Applying What You Learn <ch04-q03>

_问：_ 我参加三级修学时间不长，之前是零基础，看到有些师兄学识渊博，看过很多书，会念很多经，但我的佛法知识很少，经也不会念，很着急，怎么办？

_Q:_ I have not been in the Three-Stage Practice program long; I started from zero. Seeing how some fellow practitioners are so learned, having read many books and able to recite many sutras, while my knowledge of the Dharma is scant and I cannot recite sutras, I feel very anxious. What should I do?

_答：_ 佛法有很多法门和经论，目的都是把我们导向觉醒。不论走哪一条，终点是一致的。路不在多，关键是走对。有很多知识，会念很多经，但所学能不能指向终点？有些人虽然学了不少，却在各条路之间绕来绕去，甚至绕得迷了路。这种情况不在少数。三级修学正是针对这些问题，立足佛法根本精神，为学人建立有次第的修学道路。只要上了路，就老老实实顺着指引走，不必东跑西跑，反而是最直接的。即使之前学了其他法门，这时也要暂时放下，先按课程安排学，等有了能力再融会贯通。

_A:_ The Dharma contains many methods and scriptures, all aimed at guiding us toward awakening. No matter which path you take, the destination is the same. It is not the number of paths that matters, but whether you are on the right one. We may have much knowledge and be able to recite many sutras, but does what one has learned point to the destination? Some people have studied a great deal yet wander back and forth among various paths, even losing their way. This is not uncommon. The Three-Stage Practice was designed precisely in response to such problems; rooted in the essential spirit of the Dharma, it establishes a graduated path of study for practitioners. Once you are on the path, simply follow the guidance honestly; there is no need to run here and there---it is actually the most direct route. Even if you have studied other methods before, you should set them aside for now, follow the curriculum, and integrate them once you have the capacity.

只有真诚、认真、老实，才能稳步前行。如果浅尝辄止，或四处攀缘，是不容易学好的。从这个角度说，零基础并不是坏事。学佛不需要知道很多知识，关键是把每个阶段的法义学深入，从理解到接受，学一点就能用一点，改变一点，那才是真正的进步。

Only with sincerity, earnestness, and honesty can you advance steadily. If you dabble in things or cling to all sorts of external pursuits, it will be hard to learn well. From this perspective, starting from zero is not a bad thing. Learning Buddhism does not require knowing a great deal; the key is to study the Dharma of each stage in depth, moving from understanding to acceptance, so that whatever you learn can be put to use and bring about change. That is true progress.

=== 诵经离不开基础 / Sutra Recitation Cannot Do Without a Foundation <ch04-q04>

_问：_ 应该如何诵经？是否一部经一直读下去？

_Q:_ How should we recite sutras? Should we keep reading the same sutra over and over?

_答：_ 是否一门深入地读进去，关键在于这部经是否适合你。不同经典，蕴含着不同的见地和修行原理。但我们要知道，修行是需要基础和次第的，比如皈依、发心、戒律，是修学任何法门都绕不开的。具备这些基础，进而选择一个法门修行，或念佛，或参禅，才会有比较好的效果。否则，一开始就抓住一部经或一句佛号念着，懵懵懂懂的，并不知道这样的念要建立什么见地，导向什么修行，解决什么问题，可能念了几十年还是不知所云，还是法不入心。原因何在？就在于基础不足，在于对这些经教、佛号理解得肤浅。倘若内心不曾和法相应，自然无法念得得力。所以，基础扎实和适合自己都很重要。

_A:_ Whether you should persevere in one sutra depends on whether that sutra suits you. Different scriptures contain different perspectives and principles of practice. But we must understand that practice requires a foundation and a graduated sequence; for example, refuge, arousing the aspiration, and precepts are indispensable for studying any method. With these foundations in place, you then choose a method to practice---whether Buddha-recitation or Chan contemplation---and only then will the results be good. Otherwise, if from the start you simply cling to a sutra or a Buddha's name and recite it muddle-headedly, without knowing what perspective such recitation is meant to establish, what practice it is meant to lead to, or what problem it is meant to solve, you may recite for decades without understanding anything, and the Dharma will not enter your heart. Why? The reason lies in insufficient foundations and a shallow understanding of these scriptures and the Buddha's name. If your mind has never resonated with the Dharma, naturally you cannot recite with any power. Therefore, having a solid foundation and finding what suits you are both important.

=== 打坐怎么克服身体障碍 / How to Overcome Physical Obstacles in Sitting Meditation <ch04-q05>

_问：_ 打坐时怎么克服腿麻等问题？每次持续45分左右就坚持不住了，这一关怎么过？

_Q:_ How can I overcome problems such as numb legs when sitting in meditation? Each time I cannot sustain it beyond about forty-five minutes. How do I get past this barrier?

_答：_ 打坐的关键是善用其心，坐姿只是辅助用心的手段。正如我们讲般若正观，是要具备缘起、无自性空的认知，以此观照每个问题。从比量的思维，逐渐进入现量的正观。其中，现观通常以禅坐方式进行，而在比量的层面不一定要坐着，行住坐卧都可以用心。

_A:_ The key to sitting meditation is making good use of the mind; posture is only an auxiliary means of directing the mind. Just as when we speak of the right contemplation of prajna, we need to have the understanding of dependent origination and emptiness of intrinsic nature, and use this to contemplate every issue. We gradually move from inferential cognition to direct perception. Direct realization is usually cultivated through sitting meditation, while at the level of inference we need not be sitting; one can direct the mind while walking, standing, sitting, or lying down.

在打坐过程中，大部分人都会碰到腿痛的问题。至于每到一定时间就挺不过去，可能和身体状况有关，也可能和心理设定有关。其实开始不必一次坐很长时间，每座可以短一点，多坐几座，保持对禅修的好乐，而不是对此产生畏惧。养成禅修习惯后，觉得需要突破，就得有忍耐力。每次感觉自己坚持不了的时候，不要立刻下座，再坚持几分钟。此外，最好辅以相关的拉伸锻炼。只要下功夫，这个问题会逐步克服。

While sitting in meditation, most people will encounter leg pain. As for being unable to endure past a certain time, it may be related to physical condition or to mental expectations. At the beginning you need not sit for a long time in one session; each session can be shorter, with more sessions, so that you maintain a love for meditation rather than developing fear of it. Once you have developed the habit of meditation and feel the need to break through, you must have endurance. Each time you feel you cannot continue, do not immediately leave your seat; persevere a few minutes longer. In addition, it is best to supplement with relevant stretching exercises. As long as you put in effort, this problem will gradually be overcome.

=== 功夫需要训练 / Proficiency Must Be Trained <ch04-q06>

_问：_ 怎样观察自己内心的念头？怎么让自己这方面的功夫深一些？

_Q:_ How should I observe the thoughts in my own mind? How can I deepen my proficiency in this area?

_答：_ 戒定慧是佛法修学的常道，以戒为定慧之本。如果没有戒的保障，修行就很难得力。现代人生活丰富，信息庞杂，念头不知不觉就会被带跑。怎么办？首先要通过持戒建立简单有序的生活，当干扰少了，心清净了，就容易看到念头的来去。其次是通过禅修培养定力，这是需要反复训练的。功夫用熟了，观照力才会日益强大，对自己的所思所言所行清清楚楚。如果不刻意练习，就不会有观察念头的习惯，更无法持续、稳定地保持。古人学技艺时，强调"曲不离口，拳不离手”，学佛同样要不断"摆脱错误，重复正确”，日积月累，才能练出功夫。

_A:_ Precepts, concentration, and wisdom are the constant path of Buddhist practice; precepts are the foundation of concentration and wisdom. Without the safeguard of precepts, it is hard for practice to become effective. Modern life is rich and information is abundant, so thoughts are easily carried away without our awareness. What can we do? First, we must establish a simple and orderly life through observing the precepts. When distractions decrease and the mind becomes pure, it is easy to see thoughts come and go. Second, we must develop concentration through meditation; this requires repeated training. When the skill has been thoroughly applied, the power of mindfulness will grow stronger day by day, and you will be clearly aware of your every thought, word, and deed. Without deliberate practice, you will not develop the habit of observing thoughts, let alone sustain it continuously and stably. The ancients, when learning a skill, emphasized that "a singer keeps the tune on his lips, a boxer keeps his fists at hand"; in the same way, learning Buddhism requires constantly "abandoning what is wrong and repeating what is right." Day by day, month by month, only then can you develop real proficiency.

=== 内外兼修，保持修学状态 / Cultivating Internally and Externally to Sustain Your Practice <ch04-q07>

_问：_ 在红尘中修学，有各种诱惑和人情世故的干扰，物质生活又那么丰富，贪嗔痴时刻占据心灵。怎么保持良好的修学状态？

_Q:_ Practicing in the midst of worldly life, we face all sorts of temptations and the entanglements of human relationships, material life is so abundant, and greed, hatred, and delusion constantly occupy the mind. How can we maintain a good state of practice?

_答：_ 最根本的动力是从佛法中受益。我们之所以被诱惑，被干扰，主要因为缺乏正念和定力。所学法义还是停留在书本，没有转化为自身观念，所以在面临对境时，产生作用的还是"我”，是贪嗔痴，而不是佛陀的教导。当内心的迷惑和烦恼减少，智慧和慈悲增加，认识到修学对生命的意义和价值，才会有源源不断的力量。这种动力来自生命内在，不受外界干扰，是最为稳定的。

_A:_ The most fundamental motivation comes from benefiting from the Dharma. The reason we are tempted and disturbed is mainly that we lack right mindfulness and concentration. What we have studied still remains in books and has not been transformed into our own outlook, so when we face situations, what operates is still "I," still greed, hatred, and delusion---not the Buddha's teaching. Only when inner confusion and afflictions decrease and wisdom and compassion increase, and we recognize the meaning and value of practice for our lives, will there be an inexhaustible source of strength. This motivation comes from within life itself and is not disturbed by external conditions; it is the most stable.

但这是需要时间的，在真正受益前，离不开氛围的支持。三级修学不仅提供了有效引导，还特别重视营造氛围，让大家彼此加持。当一个人懈怠了，其他人就去推动他，支持他，互帮互扶，同愿同行。尤其是现在的大环境下，这种氛围就像小生态，可以让菩提幼苗得到有效保护。当然氛围不是现成的，要靠大家共同营造。

But this takes time. Before we truly benefit, we cannot do without the support of atmosphere. The Three-Stage Practice not only provides effective guidance but also places special emphasis on creating an atmosphere in which everyone supports and empowers one another. When one person slackens, others encourage and support him, helping and upholding one another, sharing the same aspiration and traveling the same path. Especially in the present environment, such an atmosphere is like a small ecosystem that can effectively protect the young seedling of bodhi. Of course, this atmosphere is not ready-made; it must be created together by everyone.

== 五、菩提路上 / V. On the Bodhi Path <ch05>

=== 禅修和皈依定课 / Meditation and the Refuge Daily Practice <ch05-q01>

_问：_ 我在同喜班修学，静修营中接触到了禅修，这和我们平时的皈依定课有关系吗？可以把两者结合起来吗？

_Q:_ I am studying in the Tongxi Class and encountered meditation at the retreat. How does this relate to our usual refuge daily practice? Can the two be combined?

_答：_ 皈依定课的重点是强化对三宝的信心，其中包含安住修，就是一种禅修。我们可以选择佛像或佛陀名号为所缘，安住于此，训练定力；也可以直接观察心的本质是什么，由此培养观照力。静修营的禅修体验是采用内观，但对很多人来说，因为烦恼深重，串习强大，如果单纯修内观，往往树欲静而风不止。心静不下来，就很难得力。皈依定课的观察修和安住修，使我们认识轮回苦，生起出离心，就不易被外境所转，引发不良情绪，可以为修习内观营造清净的心灵氛围。而内观培养的专注和觉察，有助于我们在修习皈依时安住。两者具有相辅相成的作用。

_A:_ The focus of the refuge daily practice is to strengthen faith in the Three Jewels. It includes _settling the mind_, which is itself a form of meditation. We may take a Buddha image or the Buddha's name as our object of focus, rest there, and train concentration; or we may directly observe what the nature of mind is, thereby developing contemplative insight. The meditation experience in the retreat uses _vipassana_, but for many people, because afflictions run deep and habitual patterns are strong, if they practice vipassana alone, it is often like the tree may crave stillness, but the wind will not cease. When the mind cannot settle, it is hard to gain strength. The analytical meditation and settling meditation in the refuge daily practice help us recognize the suffering of samsara and give rise to renunciation, so we are not easily swayed by external conditions or provoked into unwholesome states, creating a pure mental atmosphere for practicing vipassana. In turn, the focus and awareness cultivated by vipassana help us abide in the refuge practice. The two complement and reinforce each other.

=== 想到就要做到 / Think of It, Then Do It <ch05-q02>

_问：_ 我认可佛法，可内心被魔性占据，无法克服邪淫的念头，没勇气做到真诚、认真、老实，怎样才能更快地吸收佛法，不像现在这样被左右？

_Q:_ I accept the Dharma, yet my mind is possessed by demonic forces and I cannot overcome lustful thoughts. I lack the courage to be sincere, earnest, and honest. How can I absorb the Dharma more quickly, instead of being controlled as I am now?

_答：_ 你能看到自己的不足，看到内心的欲望和魔性，本身已经开始有了一点正念。否则就没能力看到问题，更谈不上对治。无始以来的贪嗔痴很强大，要摆脱三毒，必须真诚、认真、老实地落实学习方法，掌握修学内容。就像我们知道自己病了，也有了药方，关键还要认真吃药。至于怎么能更快地改变，如果方法正确，就看你能下多少功夫，改变的决心有多大。有些人想起来很急，做起来又不急了，那是没用的。烦恼如"冰冻三尺，非一日之寒”，不要想着立刻就能彻底解决。但也不要气馁，每对治一次，就会有一次的效果；如果时时对治，烦恼就没有现行机会了。

_A:_ Being able to see your shortcomings, your inner desires, and your demonic side means you have already begun to develop a little right mindfulness. Otherwise you would have no ability to see the problem, let alone remedy it. The greed, hatred, and delusion accumulated since beginningless time are very powerful. To free yourself from the three poisons, you must sincerely, earnestly, and honestly apply the learning method and master the content of study. It is like knowing you are sick and having the prescription—the key is to take the medicine seriously. As for how to change more quickly, if the method is correct, it depends on how much effort you put in and how great your resolve to change is. Some people feel urgent but do not act urgently; that is useless. Afflictions are like "three feet of ice, not formed in a single day"—do not think you can resolve them completely at once. But do not be discouraged either; each time you counter them, there is some effect; if you counter them at every moment, the afflictions have no chance to manifest.

=== 考量自己的根机 / Consider Your Capacity <ch05-q03>

_问：_ 我喜欢禅宗，可以直接修吗？还是先参加三级修学？

_Q:_ I like Chan; can I practice it directly? Or should I join the Three-Stage Practice first?

_答：_ 很多人喜欢禅宗，尤其是顿悟，好像一下就能解决问题，符合国人好简的心态，也符合现代人喜欢快餐的习惯。问题是，顿悟能不能悟得起来？你的资本是什么？禅宗是接引上根利智者，所谓上根，就是遮蔽内心的尘垢极少。就像云层很薄时，阳光才容易透出来。即使这样，也需要明眼善知识接引。如果根机不够，善知识也是提点不了的。后世不少人学禅，就是因为障深慧浅，无人引领，结果学成了口头禅，甚至成为偷懒的借口，不过是骗骗自己而已。我们提倡的三级修学，是从佛法的核心要素和次第着手。这是学佛的共同基础，适合所有根机，也和各个法门兼容。立足于此，先把基础打好，以后想修禅宗就够得着了。

_A:_ Many people like Chan, especially sudden awakening, because it seems to solve everything at once. This suits the Chinese preference for simplicity and the modern taste for fast food. The question is, can sudden awakening actually awaken you? What capital do you have? Chan is designed for those of sharp and keen faculties; "sharp faculties" means the dust obscuring the mind is extremely thin. Just as sunlight passes through easily when the clouds are thin, even then it requires a clear-eyed wise teacher to guide you. If your faculties are insufficient, even a wise teacher cannot lift you up. Later generations of Chan students, because their obstacles were deep and wisdom shallow and they had no guide, ended up with mere "lip-service Chan," or even used it as an excuse to be lazy—only deceiving themselves. The Three-Stage Practice we promote begins with the core elements and sequence of the Dharma. This is the common foundation of Buddhist practice, suitable for all faculties and compatible with every approach. Established on this foundation, once you have built up the basics, you will be able to reach Chan in the future.

=== 检验修行的标准 / The Standard for Measuring Practice <ch05-q04>

_问：_ 对于在家修行者，以什么标准衡量自己修得好不好？之前看到有人往生后烧出舍利子，这是衡量修行的标准吗？

_Q:_ For lay practitioners, what standard should we use to measure whether we are practicing well? I once saw that after someone passed away, _śarīra_ relics appeared in the cremation. Is that the standard for measuring practice?

_答：_ 怎么看自己修得好不好？通过舍利子来检验似乎晚了点，还有人以能否往生西方来衡量，也难以让所有人信服。那修行就是不可知的玄学吗？事实上，只要是如法的修学，直接可以在当下生命中看到效果。

_A:_ How can you tell whether you are practicing well? Using relics to check seems a little too late. Others measure it by whether we can be reborn in the Western Pure Land, but that too is hard to convince everyone. Does this mean practice is an unknowable mysticism? As long as we practice according to the Dharma, the effects can be seen directly in this present life.

生命是缘起的，其中有负面和正向的力量。修行就是断恶修善、转染成净的过程，如果方法得当，我们一定能感受到内心的烦恼在减少，智慧和慈悲在增长。许多三级修学的学员通过实践，确实看到自己的观念、心态、待人处世的方式在改变，看到家庭和工作中的人际关系在改变。家人、朋友、同事也会看到这些改变。所以说，有效的修学一定会带来生命成长，而且是自己和周围人都能见证的。如果无法检验，自己也不知道修得对不对，好不好，显然是有问题的。

Life is dependently originated; within it are negative and positive forces. Practice is the process of abandoning evil and cultivating good, transforming the defiled into the pure. If the method is appropriate, we will certainly feel afflictions decreasing within the mind and wisdom and compassion growing. Many students of the Three-Stage Practice, through practice, have indeed seen changes in their views, attitudes, and ways of dealing with people and situations, and have seen changes in family and work relationships. Family, friends, and colleagues also see these changes. Therefore, effective practice will certainly bring growth in life—something both oneself and those around us can witness. If it cannot be tested and you yourself do not know whether it is right or good, clearly there is a problem.

=== 只有往生净土这条路吗 / Is Rebirth in the Pure Land the Only Way? <ch05-q05>

_问：_ 在家人不能证得阿罗汉果，若想今生解脱，是否只有往生净土这条路？修行应该"要见十方佛”，还是"闲观一片心”？

_Q:_ Laypeople cannot attain arhatship. If we wish to attain liberation in this life, is rebirth in the Pure Land the only path? Should practice be "to see the Buddhas of the ten directions," or "to leisurely observe the single mind"?

_答：_ 从声闻乘来说，在家居士可以证到三果，已是很高的果位。而从菩萨乘来说，很多大菩萨都是以在家身份出现的，比如我们熟悉的弥勒菩萨、观音菩萨、文殊菩萨等，善财童子五十三参所参访的大善知识中，也有很多在家居士。当然，如果没有今生解脱的把握，念佛求生净土是比较保险的，这也是很多祖师大德的选择。

_A:_ From the perspective of the shravaka vehicle, lay practitioners can attain the third fruit, which is already a high attainment. From the perspective of the bodhisattva vehicle, many great bodhisattvas appear in lay form—for example, Maitreya Bodhisattva, Avalokiteshvara Bodhisattva, and Manjushri Bodhisattva, whom we all know; among the fifty-three wise teachers visited by Sudhana in his pilgrimage, many were also lay practitioners. Of course, if you are not confident of attaining liberation in this life, reciting the Buddha's name and seeking rebirth in the Pure Land is the safer choice, and it is the path taken by many patriarchs and great masters.

至于第二个问题，要根据每个人的实际情况来抉择。有能力闲观一片心，不妨直接观心。如果内心散乱，无法观照，可以通过念佛将心念专注于佛号。相对来说，持名念佛比观心会容易些。另外，念佛和观心也可以统一起来，这样念的效果比较好。

As for the second question, it should be decided according to each person's actual circumstances. If you have the ability to leisurely observe the single mind, you may directly observe the mind. If the mind is scattered and unable to observe, you can focus the mind on the Buddha's name through recitation. Relatively speaking, reciting the Buddha's name is easier than observing the mind. Moreover, recitation and observing the mind can also be unified, and this kind of recitation is more effective.

=== 依止和广学 / Relying on a Teacher and Studying Broadly <ch05-q06>

_问：_ 请了一位善知识的法，是否会形成依止关系？是否可以学习其他法师所说的法？

_Q:_ If I request the Dharma from a wise teacher, does that create a relationship of reliance? May I also study the Dharma taught by other teachers?

_答：_ 单纯的请法，还说不上建立依止关系。我们想依止某位善知识学法，首先要了解他的德行和学养，不少经论列出了标准，如《略论》的善知识十德等。总之，要根据佛法而不是自己的感觉来判断。确定这是具格善知识，发愿依止他修学，他也愿意摄受你，才能确定学法的关系。确定之后，自己也要具足弟子相，有学法意乐，才能从这样的依止中受益。如果以后还要学别的法门，最好请教一下善知识。当然，前提是你所依止的确实是真善知识，了解你的情况，也有能力对你的选择作出判断，有能力对你加以引导。

_A:_ Merely requesting the Dharma does not yet constitute a relationship of reliance. If we wish to rely on a wise teacher, we must first understand his virtue and learning. Many scriptures and treatises list standards, such as the ten qualities of a qualified teacher in the _Lamrim_ (Stages of the Path). In short, we must judge according to the Dharma, not according to our own feelings. Once you determine that he is a qualified wise teacher, make the aspiration to rely on him for study, and he is willing to accept you—only then can the relationship of teacher and student be established. After it is established, you yourself must also possess the marks of a disciple and have the aspiration to learn, in order to benefit from such reliance. If later you wish to study other approaches, it is best to consult your teacher. Of course, this presupposes that the one you rely on is a true wise teacher who knows your situation and has the ability to judge your choices and guide you.

=== 如何在生活中实践佛法 / How to Put the Dharma into Practice in Daily Life <ch05-q07>

_问：_ 对在家居士来说，如何在生活中实践佛法，运用般若正观？

_Q:_ For lay practitioners, how can we put the Dharma into practice in daily life and apply prajna contemplation?

_答：_ 佛法是人生的智慧，一方面是帮助我们正确认识世间，透彻人生真相；一方面是帮助我们摆脱迷惑，建立健康的观念，建立和解脱相应的行为。所以真正的修行要在生活中历练。尤其对在家居士来说，能将菩提心和般若正观带入生活，处处都是修行道场，让人历境炼心，磨砺习气。

_A:_ The Dharma is the wisdom of life. On one hand, it helps us correctly understand the world and thoroughly perceive the truth of life; on the other hand, it helps us free ourselves from confusion, establish wholesome views, and act in ways that lead to liberation. Therefore, true practice must be tempered in daily life. Especially for lay practitioners, if you can bring bodhicitta and prajna contemplation into life, every place becomes a place of practice, allowing you to refine the mind through circumstances and grind away habitual patterns.

至于运用般若正观，首先要获得般若正见。这两天所说的"《心经》的般若正观”，正是帮助我们从缘起的角度看待世间，认识到一切都是因缘和合的假相，其本质是空无自性的。当我们确立这种知见后，面对任何现象都要用《心经》所说的"色不异空，空不异色；色即是空，空即是色”来观察。运用这一公式的过程，就是修习般若正观的过程。在此基础上，才能逐渐导入实相般若。所以关键是建立和运用般若正见，如果没有确立空性正见，般若法门的观修自然无从谈起。

As for applying prajna contemplation, you must first obtain the right view of prajna. The "prajna contemplation of the Heart Sutra" spoken of these past two days is precisely what helps us regard the world in terms of dependent origination, recognizing that all things are dependently arisen appearances and that their essence is empty of self-nature. Once we have established this understanding, we must use the Heart Sutra's formula "form is not other than emptiness, emptiness is not other than form; form is emptiness, emptiness is form" to observe every phenomenon. The process of applying this formula is the practice of prajna contemplation. On this basis, one can gradually enter ultimate prajna. Therefore, the key is to establish and apply the right view of emptiness; without establishing the right view of emptiness, the contemplative practice of prajna approaches naturally cannot be discussed.

=== 什么身份适合修行 / Which Status Is Suitable for Practice? <ch05-q08>

_问：_ 在目前这个时代，出家人似乎也很辛苦，究竟哪种方式适合修道呢？

_Q:_ In the present age, monastics also seem to have a hard life. Which way of life is truly suitable for cultivating the path?

_答：_ 从佛陀建立出家制度的角度来说，当然出家更有利于修行。尤其在修行初期，仅靠个人力量，很难摆脱世俗的诱惑，摆脱内心的欲望、情绪和烦恼，这就需要善知识为护佑，需要清净环境为助缘。出家没有太多的世俗负担，没有复杂的人际关系，相对来说更为单纯。但现在的寺院受经济浪潮影响，真正如法的修道环境也不多。

_A:_ Looking at why the Buddha established the monastic system, of course going forth is more conducive to practice. Especially in the early stages of practice, relying on one's own strength alone, it is difficult to escape worldly temptations and to escape inner desires, emotions, and afflictions. For this one needs a wise teacher for protection and a pure environment as supporting conditions. Going forth carries few worldly burdens and has no complicated human relationships; relatively speaking, it is simpler. But nowadays, influenced by economic tides, there are not many temples that truly provide a suitable environment for cultivating the path.

为什么说今天是末法时代？就是因为诱惑太多，环境太险峻，修行人很难找到用功办道之地。过去的寺院，一道围墙就和尘世是两个天地。而在红尘滚滚的今天，到处是围墙挡不住的网络和电视，只有靠我们内在的围墙来抵挡。所以在今天，无论以哪种方式修行都很难。

Why is it said that today is the Dharma-ending age? Because there are too many temptations and the environment is too perilous; practitioners can hardly find a place to apply themselves. In the past, a single temple wall separated the temple from the dust of the world. Today, in the midst of the rolling red dust, everywhere there are networks and televisions that walls cannot block; we must rely on an inner wall to withstand them. Therefore, in today's world, whichever way we practice is difficult.

世间那么多人在欲望中辛苦挣扎，唯有真正认识到轮回的本质是苦，才能生起猛利的出离心。这种出离心不是厌倦，而是因为你已看透世间本质。虽然在做很多事，但只是为了生存的方便，利他的方便。这种做事就不易对我们构成干扰。否则，你对轮回还会充满期待，即使换个环境也没用，因为环境只能起到暂时的辅助作用。

So many people in the world struggle bitterly within desire. Only by truly recognizing that the essence of samsara is suffering can we give rise to intense renunciation. This renunciation is not disgust; it arises because you have thoroughly seen through the nature of the world. Although you may still do many things, they are only for the sake of survival and for the sake of benefiting others. Such activity is not likely to disturb us. Otherwise, you will still be full of expectations for samsara, and even changing the environment will be useless, because the environment can only provide temporary assistance.

作为在家居士来说，关键在于透彻轮回本质，确定三宝为究竟皈依，从而生起出离心，并进一步提升为菩提心。如果能以这种心行生活，在家一样可以修行。正如《维摩经》所说："汝等便发阿耨多罗三藐三菩提心，是即出家，是即具足。”当然，如果有出家的因缘，有殊胜的道场，有善知识的引导，出家确实可以有更多的时间用于修行和弘法利生。

For lay practitioners, the key is to thoroughly understand the nature of samsara, take the Three Jewels as the ultimate refuge, thereby give rise to renunciation, and further elevate it to bodhicitta. If you can live with this mental conduct, you can practice equally well as a layperson. As the _Vimalakirti Sutra_ says, "If you arouse the mind of anuttara-samyak-sambodhi, that is going forth, that is complete fulfillment." Of course, if there are the conditions to go forth, a superior place of practice, and the guidance of a wise teacher, monastic life does afford more time for practice and for propagating the Dharma and benefiting sentient beings.

== 六、闻思正法 / VI. Hearing and Contemplating the True Dharma <ch06>

=== 觉醒之后去哪儿 / Where to Go After Awakening <ch06-q01>

_问：_ 我之前修净土宗，知道念佛可以去极乐世界。进入三级修学后，知道要走向觉醒，那未来的归宿是什么？我生活在娑婆世界，很希望通过修行去一个美好的地方。那么，觉醒之后到底去哪里？

_Q:_ I previously practiced the Pure Land school and knew that reciting the Buddha's name could lead to the Pure Land. After entering the Three-Stage Practice, I understand that we should move toward awakening. What then is our future destination? I live in the Saha world and hope to reach a better place through practice. So where exactly do we go after awakening?

_答：_ 在佛法中，并不是把极乐世界作为永久归宿，而是作为进修场所。因为那里的修行环境好，不会退转，而娑婆世界诱惑众多，修起来障碍重重。所以往生净土是为了更好地修行，最终还要倒驾慈航，度化众生。

_A:_ In the Dharma, the Pure Land is not regarded as a permanent destination, but as a place for further cultivation. The environment there is conducive to practice, and we will not regress, whereas the Saha world is full of temptations and obstacles. Thus, attaining rebirth in the Pure Land is for the sake of better practice, and ultimately we must return to guide sentient beings.

走向觉醒，不仅为了自利，也是为了利他。因为觉醒的生命才是自由的，才能为悲愿驱使，在十方世界自在来去，哪里有众生需要就到哪里。众生是随着业力，身不由己地在轮回流转，而佛菩萨悲愿无尽，十方法界都是他的道场。所以觉醒后可去的地方太多了，而且对觉悟者来说，哪里都是西方极乐，不是娑婆世界。

Moving toward awakening is not only for our own benefit, but also for the benefit of others. Only an awakened life is truly free and can be moved by compassionate vows to come and go freely throughout the ten directions, going wherever sentient beings need help. Ordinary beings drift through samsara driven by karma, unable to control their course, while the Buddhas and bodhisattvas have inexhaustible compassionate vows; the entire Dharma realm is their field of practice. Thus, after awakening there are countless places to go, and for the awakened one, everywhere is the Western Pure Land, not the Saha world.

=== 净土到底有没有 / Does the Pure Land Truly Exist? <ch06-q02>

_问：_ 净土究竟是怎样的存在？中观说缘起性空，唯识说诸法唯识，天台说一念三千，华严说世界圆融无碍。这么看，净土只是人心所变。但净土经典又说，我们可以往生西方听闻佛法。这么看，似乎有具体的地方。到底有没有呢？

_Q:_ What kind of existence is the Pure Land? Madhyamaka teaches dependent origination and emptiness of nature; Consciousness-Only teaches that all dharmas are mind-only; Tiantai teaches three thousand realms in a single thought; Huayan teaches that worlds interpenetrate without obstruction. From these perspectives, the Pure Land seems to be merely a transformation of the mind. Yet the Pure Land sutras say we can be reborn in the West to hear the Dharma. From this perspective, it seems to be a specific place. Does it exist or not?

_答：_ 佛法说："一切有为法，如梦幻泡影。”在究竟意义上，净土也是梦幻泡影，但这并不是说它不存在。我们现在的世界就是梦幻泡影，是条件关系的假相，而在凡夫的认识中，认定它是实实在在的。如果从另外的角度，即使是属于世间法的量子力学，所见也完全不同。

_A:_ The Dharma says, "All conditioned phenomena are like a dream, an illusion, a bubble, a shadow." In the ultimate sense, the Pure Land too is like a dream or illusion, but this does not mean it does not exist. Our present world is also like a dream or illusion, a temporary appearance of dependent conditions, yet ordinary beings take it as solid and real. From another angle, even quantum mechanics, which belongs to worldly knowledge, shows us something quite different.

净土到底有没有？关键是从什么角度看。我们之所以有这样的问题，是把有和空对立起来。事实上，说虚幻并不影响它的存在，说存在也不影响它的虚幻。我们眼中的一切存在，都是透过自身业力系统看到的。在不同的业力系统，世界以不同的方式呈现。所以说，认识模式决定了我们会看到什么样的世界。在天台、华严各宗法义中，都蕴含着这些道理，进一步学就会清楚了。对个人修学来说，如果你是学净土的，就要深信净土，发愿往生净土。如果学其他法门，就根据本宗法义来建立认识。学法还没有一定深度时，不要把这些放在一起比较。

Does the Pure Land exist or not? The key is from which perspective we look. The reason we have such questions is that we set existence and emptiness in opposition. In fact, calling it illusory does not affect its existence, and calling it existent does not affect its illusory nature. All that we see is perceived through our own karmic system. In different karmic systems, the world appears differently. Thus, how we perceive determines what kind of world we see. These principles are contained in the teachings of the Tiantai and Huayan schools, and will become clear with further study. For personal practice, if you follow the Pure Land method, you should have deep faith in the Pure Land and vow to be reborn there. If you follow another method, establish your understanding according to your own school's teachings. Until your study has reached a certain depth, do not compare these views with one another.

=== 有多少个世界 / How Many Worlds Are There? <ch06-q03>

_问：_ 每个人业力不同，看到的世界就不一样。也就是说，每个人都有自己的世界。那是不是有很多个世界，还是究竟来说只有一个？

_Q:_ Each person's karma is different, so the world they see is different. That is to say, each person has their own world. Are there then many worlds, or ultimately only one?

_答：_ 在究竟意义上，世界是没有差别的，也不以任何形相出现。而在缘起的层面，世界有着千差万别。众生因为业力不同，虽然生活在共业所感的同一个世界，但戴着各自的有色眼镜，又处在自己独有的差别世界。从这个角度说，有多少众生，就有多少世界。问题在于，这个世界是被错误观念和不良情绪左右的，会给生命带来无尽烦恼。学佛就是帮助我们摘掉有色眼镜，从缘起的智慧看世界，看到无常无我的真相，看到一切事物的空性。用现在的话说，就是透过现象看本质。

_A:_ In the ultimate sense, the world is without distinction and does not appear in any fixed form. At the level of dependent origination, however, worlds are infinitely diverse. Because sentient beings have different karma, although they live in the same world shaped by shared karma, each wears their own colored glasses and inhabits a unique, differentiated world. From this perspective, there are as many worlds as there are sentient beings. The problem is that this world is dominated by wrong views and afflictive emotions, which bring endless vexation to life. Learning Buddhism helps us remove these colored glasses and see the world through the wisdom of dependent origination, perceiving the truth of impermanence and no-self, and seeing the emptiness of all phenomena. In modern terms, it is seeing through appearances to the essence.

=== 无为法也有差别吗 / Are There Differences in the Unconditioned? <ch06-q04>

_问：_ 《金刚经》说："一切圣贤皆以无为法而有差别。”有为法的差别容易理解，为什么无为法还有差别？

_Q:_ The _Diamond Sutra_ says, "All sages and saints are distinguished by the unconditioned Dharma." Differences in conditioned dharmas are easy to understand, but why are there differences in the unconditioned Dharma?

_答：_ 这句话出自《金刚经》第七品"无得无说分”，是须菩提尊者对佛陀所问的回答。这并不是说无为法本身有差别，而是说三乘圣贤对无为法的体悟有深浅不同。就像同样的天空，每个人看到的并不一样。透过房间窗口只能看到一小块天空，在城市广场可以看到一大块，在广阔草原可以看到无边无际的天空。天空本身没有大小，但因为观看者的视野不同，就显得有大小了。

_A:_ This passage is from the seventh chapter of the _Diamond Sutra_, "Nothing Attained, Nothing Spoken," and is the response of the Venerable Subhuti to the Buddha's question. It does not mean that the unconditioned Dharma itself has differences, but that the realizations of the noble ones of the three vehicles into the unconditioned Dharma vary in depth. It is like the same sky: what each person sees is not the same. Through a room window one sees only a small patch; in a city square one sees a large expanse; on an open prairie one sees a boundless sky. The sky itself has no size, but because the viewer's field of vision differs, it appears to have size.

=== 能观和所观 / The Observer and the Observed <ch06-q05>

_问：_ 能观之智和所观之境是否二元对立的存在？当心安住于空性，是否就没有能所？

_Q:_ Are the wisdom that observes and the object observed a dualistic opposition? When the mind abides in emptiness, is there no longer any observer and observed?

_答：_ 对尚未契入空性的凡夫来说，我们有能有所，这个能所是妄识的作用。当心出现能所时，就会陷入对能所的执著中。在禅修过程中，观照到境界是空之后，还要将依境界建立的妄心空掉，心空境寂，才能从观照般若契入实相般若。其实，佛菩萨的境界中也有能有所，但这些能所只是一种因缘假相，不会构成对立。因为他已体证超越能所的空性，心是安住于空性，而非因缘假相。

_A:_ For ordinary beings who have not yet realized emptiness, there is an observer and observed, which are the functioning of deluded consciousness. When the mind produces this duality, it becomes caught in attachment to it. In meditation, after contemplating that objects are empty, we must also empty the deluded mind that is established in dependence upon objects. When mind is empty and objects are still, one can move from contemplative prajna to prajna of ultimate reality. In fact, in the state of the Buddhas and bodhisattvas there is still an observer and observed, but these are merely conditional appearances that do not constitute opposition. Because they have realized emptiness that transcends observer and observed, their minds abide in emptiness rather than in conditional appearances.

=== 自性、法性、空性、佛性 / Self-Nature, Dharma-Nature, Emptiness, and Buddha-Nature <ch06-q06>

_问：_ 佛法所说的自性是什么？法性、空性和佛性是否一样？

_Q:_ What does the Dharma mean by self-nature? Are Dharma-nature, emptiness, and Buddha-nature the same?

_答：_ 如果从世俗谛角度来说的自性，是佛法所否定的。佛法认为，宇宙万有都是缘起的，是无自性空的。这个无自性所否定的，是依有为法建立的自性，这种自性绝对是没有的。《心经》处处强调不、无、空，空的都是这种自性见。

_A:_ The self-nature spoken of in terms of conventional truth is what the Dharma rejects. The Dharma holds that all things in the universe arise dependently and are empty of self-nature. What is negated by this lack of self-nature is the self-nature established upon conditioned phenomena; such a self-nature definitely does not exist. The _Heart Sutra_ repeatedly emphasizes no, without, and empty, and what it empties is precisely this view of self-nature.

但佛法有时也建立自性，这是从圣义谛的角度来说，和《心经》否定的自性概念不同。这种自性代指佛性或空性，如《六祖坛经》所说的"菩提自性，本来清净，但用此心，直了成佛”，此处的菩提自性就是指佛性，代表生命本自具足的觉醒力量。

Yet the Dharma sometimes also speaks of establishing self-nature. This is in terms of ultimate truth and differs from the concept of self-nature rejected by the _Heart Sutra_. This self-nature refers to Buddha-nature or emptiness. As the _Platform Sutra of the Sixth Patriarch_ says, "The bodhi self-nature is originally pure; simply use this mind, and directly become Buddha." Here, bodhi self-nature refers to Buddha-nature, representing the awakened power inherently present within life.

在本质上，佛性、法性、空性是没有差别的。但这些名称的安立有所侧重，佛性是侧重从有情方面来说，空性、法性侧重从法的角度去说。但不论空性还是佛性，本质是无二无别的。

In essence, Buddha-nature, Dharma-nature, and emptiness are without distinction. However, these names are established with different emphases: Buddha-nature emphasizes the side of sentient beings, while emptiness and Dharma-nature emphasize the side of dharmas. Yet whether emptiness or Buddha-nature, their essence is nondual and without distinction.

=== 普贤行愿乃真功德 / Samantabhadra's Vows Are True Merit <ch06-q07>

_问：_ 法师开示《普贤行愿品》时说，行持十大愿王有很多功德，不知什么是功德，什么是福德？

_Q:_ When the Dharma teacher expounded _Samantabhadra's Vows_, he said that practicing the Ten Great Vows brings much merit. I am not clear what is meant by merit and what is meant by virtue.

_答：_ 在普通意义上，功德和福德并没有明确界定，都是善行招感的结果。而在《六祖坛经》中，对功德和福德作了区分，认为出自觉性、清净无漏的行为才称为功德，所谓"见性是功，平等是德，念念无滞，常见本性，真实妙用，名为功德”。而世人由凡夫心造作的有漏善行，只能称为福德，在本质上不算是真正的修行，也就是《坛经》所说的"汝等终日只求福田，不求出离生死苦海，自性若迷，福何可救”。

_A:_ In ordinary usage, merit and virtue are not clearly distinguished; both are results produced by good conduct. However, the _Platform Sutra of the Sixth Patriarch_ distinguishes between them, holding that actions arising from self-nature, pure and undefiled, are called merit. As it says, "Seeing the nature is _gong_; equality is _de_; thought after thought without obstruction, constantly seeing one's original nature, and true, wondrous function are called merit." Good deeds performed by ordinary people with an ordinary mind are conditioned and can only be called virtue; in essence they are not true practice. This is what the _Platform Sutra_ means by saying, "You spend all day seeking only fields of blessing, not seeking to escape the sea of birth and death. If the self-nature is deluded, how can blessing save you?"

如果我们按《普贤行愿品》阐述的原理观修，以无限的心，依无限的所缘，修习礼敬诸佛乃至普皆回向的十大愿王，是属于功德范畴，而且是无量功德。因为这是直接临摹佛菩萨的心行，是成就佛菩萨的品质，而不是凡夫心。

If we practice contemplation according to the principles explained in _Samantabhadra's Vows_, using a boundless mind and relying on boundless objects, cultivating the Ten Great Vows from revering the Buddhas to dedicating all merit universally, this belongs to the category of merit, and indeed immeasurable merit. For it directly models the mind and conduct of the Buddhas and bodhisattvas, and develops their qualities, rather than remaining within the ordinary mind.

=== 见和不见 / Seeing and Not Seeing <ch06-q08>

_问：_ 什么是"见性之时，见心不见境”？怎么将这样的认识落实到修行中？

_Q:_ What does it mean that "when seeing the nature, one sees the mind and not the objects"? How can such an understanding be applied in practice?

_答：_ 明心见性所见到的觉性，没有体相，也没有一切差别相。它既不是心，也不是境，同时又不妨碍一切现象，所以空性和显现不是对立的。见性之时，不只是不见境，也可以不见心，即《金刚经》所说的"过去心不可得，现在心不可得，未来心不可得”。经中以无住生心为修行要旨，怎么做到无住？首先要树立无常无我的正见，带着这样的认识看世界，才能减少对境的粘著，进而通过禅修体认心和境的空性本质。这时就会真正看到，万法确实是无常的，五蕴确实是无我的。

_A:_ The awakened nature seen in clear mind and seeing the nature has no substance or form, and no marks of distinction. It is neither mind nor object, yet it does not obstruct any phenomena; thus emptiness and appearance are not in opposition. When seeing the nature, it is not only objects that are not seen; even the mind is not seen, as the _Diamond Sutra_ says, "The past mind cannot be grasped, the present mind cannot be grasped, the future mind cannot be grasped." The sutra takes the arousing of mind without attachment as the essence of practice. How does one remain unattached? First, one must establish the right view of impermanence and no-self. With this understanding one views the world, which reduces clinging to objects, and then through meditation one realizes the empty nature of both mind and objects. Then one will truly see that all dharmas are indeed impermanent, and that the five aggregates are indeed without self.

=== 不识本心，学法无益 / Not Knowing One's Own Mind, Studying the Dharma Is of No Benefit <ch06-q09>

_问：_ 什么是明心见性？如何才能明心见性？

_Q:_ What is clear mind and seeing the nature? How can we achieve clear mind and see the nature?

_答：_ 我们这次的主题讲座《走出轮回，走向解脱》，就是通过佛陀的修道经验来说明如何明心见性，以及明心见性到底是明什么，见什么。如果用心听的话，对这个问题应该是清楚的。明心见性是佛法修行的核心，也是共同的目标。其源头来自佛陀的修行，他在菩提树下禅坐，由顺逆观十二缘起见到诸法实相，证悟成佛。其后，各宗派又从不同角度契入，对明心见性提出基于本宗的见地，以及相应的修行方法。唯识是通过对心的认识，转染成净，转识成智；中观是通过层层扫荡，证悟空性；禅宗是找到那个本来清净、本无生灭、本不动摇、本自具足的菩提自性。虽然方法不同，但核心是一致的。偏离这个根本，修行只是表面文章而已，也就是古德所说的"不识本心，学法无益”。

_A:_ The theme of this series of talks, "Leaving Samsara, Moving Toward Liberation," uses the Buddha's own experience of practice to explain how to realize clear mind and see the nature, and what exactly is made clear and what is seen. If you have listened attentively, this should already be clear. Clear mind and seeing the nature is the core of Buddhist practice and the shared goal. Its source lies in the Buddha's practice: seated in meditation beneath the Bodhi tree, he contemplated the Twelve Links of Dependent Origination in forward and reverse order, saw the true nature of all dharmas, and attained awakening. Later, the various schools approached this from different angles, presenting views based on their own traditions and corresponding methods of practice. Consciousness-Only does so through understanding the mind, transforming the defiled into the pure, and turning consciousness into wisdom. Madhyamaka does so through progressively sweeping away all attachment and realizing emptiness. Zen does so by finding the bodhi self-nature that is originally pure, neither arising nor ceasing, unmoving, and inherently complete. Although the methods differ, the core is the same. To stray from this root is to make practice mere outward show, as the ancient masters said, "Not knowing one's own mind, studying the Dharma is of no benefit."

== 七、缘起无我 / VII. Dependent Origination and No-Self <ch07>

=== 五蕴非我，我在哪 / The Five Aggregates Are Not the Self; Where Am I? <ch07-q01>

_问：_ 我在大学教心理学，会让学生从行为、想法、感受来寻找"我”。很多心理问题正是因为人们不知道这些、不能表达或被压抑了。如果五蕴也不是我，怎么解读关于自我的部分？

_Q:_ I teach psychology at a university. I ask students to look for the _self_ through behavior, thoughts, and feelings. Many psychological problems arise precisely because people are unaware of these, cannot express them, or have repressed them. If the five aggregates are also not the self, how should we interpret the self?

_答：_ 佛教讲无我，也讲假我，并不否定缘起的五蕴身，只是否定其中有恒常不变、不依赖条件存在的自性。换言之，是否定我们对事物的错误认知，而不是现象本身。唯识宗讲三性，即遍计所执性、依他起性、圆成实性。就像有人在月光下看到绳子，以为是蛇而受到惊吓。蛇是主观的错觉，根本就不存在，为遍计所执；绳子代表缘起的现象，为依他起。空并不是否定绳子，而是否定蛇的错觉，告诉我们一切都是条件的假相。

_A:_ Buddhism speaks of no-self (_anatman_), yet it also speaks of the conventional self. It does not deny the conditioned body of the five aggregates; it only denies that within them there is a permanent, unchanging self-nature that exists independently of conditions. In other words, it negates our mistaken cognition of things, not the phenomena themselves. The Consciousness-Only school teaches the three natures (_trisvabhava_): the falsely conceived nature (_parikalpita_), the dependent nature (_paratantra_), and the perfectly realized nature (_parinishpanna_). It is like someone seeing a rope in the moonlight and mistaking it for a snake, becoming frightened. The snake is a subjective illusion that does not exist at all—that is the falsely conceived nature. The rope represents the conditioned phenomenon—that is the dependent nature. Emptiness does not deny the rope; it denies the illusion of the snake, telling us that everything is a conditioned appearance.

我们戴着有色眼镜看世界，所见离不开自己的认知模式，并受到观念、情绪、经验、好恶的影响。就像我们喜欢一个人，看他做什么都很顺眼，反之，看他做什么都不顺眼。我们非常相信这个感觉，认为世界就是自己看到的那么回事。其实，呈现在我们认识上的世界，并不是客观存在的那个。佛法就是不断告诉我们，事实的世界是怎么回事。一旦跳出错误的认知模式，如实看清真相，当下就能在缘起现象中通达空性。反之，则会由我法二执的错觉产生所知障和烦恼障。然后继续带着二执二障看世界，使所见被进一步遮蔽。

We view the world through colored glasses; what we see cannot be separated from our own cognitive patterns and is influenced by concepts, emotions, experience, likes, and dislikes. Just as when we like someone, everything they do looks agreeable, whereas when we dislike someone, everything they do looks disagreeable. We deeply believe in this feeling and think the world is exactly as we see it. In fact, the world as it appears to our cognition is not the objectively existing world. The Dharma keeps telling us what the world of facts is really like. Once we step out of mistaken cognitive patterns and see the truth as it is, we can immediately realize emptiness within conditioned phenomena. Otherwise, the illusion of attachment to self and dharmas gives rise to the cognitive obstructions and the afflictive obstructions. Then, continuing to view the world through these two attachments and two obstructions, what we see becomes further obscured.

怎么认识自己、解读自我？虽然假我的部分可以从五蕴来寻找，但如果停留于此，是找不到真相的。只有透过五蕴，看到色受想行识只是条件关系的假相，才能看到我的本来面目，这是必须通过修行体证的，而不是意识层面的思维和判断。

How do we know ourselves and interpret the self? Although the conventional self can be sought within the five aggregates, if we stop there we will not find the truth. Only by penetrating the five aggregates and seeing that form, feeling, perception, formations, and consciousness are merely conditioned appearances can we see our original face. This must be realized through practice, not through conceptual thinking and judgment.

=== 真正的我是什么 / What Is the True Self? <ch07-q02>

_问：_ 听了讲座，感觉我的所谓烦恼，只是在六根和五蕴的作用下，由错误认知产生的，但也带来另一个问题：假设这些都不是我，真正的我是什么？

_Q:_ After listening to the lecture, I feel that my so-called afflictions are produced by mistaken cognition under the workings of the six sense bases and the five aggregates. But this raises another question: if none of these is the self, what is the true self?

_答：_ "我是谁”，是佛法修行解决的核心问题。我们会把身体、相貌、财富、地位等当作是我，如果以智慧审视，会发现这些和我们只是暂时的关系。这种对自我的错误认定是一切痛苦的根源。世间每天会发生很多灾难，我们通常只是听听而已，未必有什么感觉。但只要贴上"我”的标签，马上会对我们构成影响，甚至让人崩溃。佛教说无我，并不是说你不存在，而是否定对自我的错误认定，引导我们真正找到自己。

_A:_ "Who am I?" is the central question addressed by Buddhist practice. We take the body, appearance, wealth, status, and so on as the self, but if we examine them with wisdom, we find that they are only temporary conditions in relation to us. This mistaken identification with the self is the root of all suffering. Every day many disasters occur in the world; usually we just hear about them and may not feel much. But as soon as we attach the label "mine" or "me," they immediately affect us and can even overwhelm us. When Buddhism speaks of no-self, it does not mean that you do not exist; it denies the mistaken identification with the self and guides us to truly find ourselves.

关于对自我的认识，佛法有两个切入角度。一是在认知层面，引导我们看清什么不是我，从而排除干扰；二是通过禅修摆脱妄念，把心带回当下，通过持续、稳定的专注培养定力。然后就可以在此基础上修观，看到五蕴乃至诸法的实相。更重要的是，可以进一步开启智慧。一旦开启它，不仅能知道"我是谁”，还能找到自我拯救的能力，找到生命的最大价值。

Regarding the understanding of the self, the Dharma approaches it from two angles. First, at the cognitive level, it guides us to see what is _not_ the self, thereby removing interference. Second, through meditation we free ourselves from stray thoughts, bring the mind back to the present, and develop meditative stability through sustained, steady concentration. On this basis we can then practice insight and see the true nature of the five aggregates and all dharmas. More importantly, we can further awaken wisdom. Once awakened, we can not only know "who I am" but also discover the ability to save ourselves and find the greatest value of life.

=== 我、末那、阿赖耶和佛性 / The Self, Manas, Alaya, and Buddha-Nature <ch07-q03>

_问：_ 什么是末那识和阿赖耶识？和我是什么关系？和佛性是什么关系？

_Q:_ What are the Manas consciousness and the Alaya consciousness? What is their relationship to the self? What is their relationship to Buddha-nature?

_答：_ 末那识和阿赖耶识出自唯识的八识思想，属于潜意识，即平时感觉不到的部分。末那识是我执的根本，它把阿赖耶识执以为"我”，引发了与此相关的一切烦恼。为什么会执阿赖耶识为"我”？因为阿赖耶识具有储藏功能，保存着生命延续过程中的所有信息。我们无始以来的一切所思所言所行，不是发生后就结束的，还会在内心留下影像，形成种种心理力量。关于这方面的内容，可以参考我的《认识与存在》一书。这是关于《唯识三十论》的解读，对八识及运作原理有详细说明。

_A:_ Manas and Alaya come from the Consciousness-Only teaching of the eight consciousnesses and belong to the subconscious—the part we normally cannot perceive. Manas is the root of self-attachment; it grasps the Alaya consciousness as "self," giving rise to all afflictions connected with this. Why does it grasp Alaya as the self? Because the Alaya consciousness has a storage function, preserving all the information accumulated in the continuity of life. Everything we have thought, said, and done since beginningless time does not simply end when it happens; it leaves impressions in the mind, forming various mental forces. For more on this, you may refer to my book _Cognition and Existence_. It is a commentary on the _Thirty Verses on Consciousness-Only_, giving a detailed explanation of the eight consciousnesses and how they function.

关于阿赖耶识，唯识宗的旧译和新译有不同诠释。旧译认为阿赖耶识有染的部分，即妄识，是迷妄系统开展的基础；同时也有清净的部分，相当于佛性，是成佛的基础。而在玄奘三藏翻译的唯识经典中（新译），基本是不讲佛性的。

Regarding the Alaya consciousness, the old and new translations of the Consciousness-Only school offer different interpretations. The old translation holds that the Alaya consciousness has defiled aspects, namely the deluded consciousness, which is the basis for the development of the deluded system; at the same time, it also has pure aspects, equivalent to Buddha-nature, which is the basis for becoming a Buddha. In the Consciousness-Only classics translated by Tripitaka Master Xuanzang (the new translation), Buddha-nature is basically not discussed.

=== 克隆只是出生方式不同 / Cloning Is Only a Different Mode of Birth <ch07-q04>

_问：_ 佛教怎么看克隆人？这算不算是一种生命？

_Q:_ What does Buddhism think of human cloning? Does this count as a form of life?

_答：_ 克隆人是全世界共同禁止的，会带来道德、伦理等众多问题，后果不堪设想。虽然佛典中没有说到这个问题，但佛法不离世间法，既然对众生有那么多危害，自然也是佛教反对的。但从原理来说，克隆人也是独立的生命体，只是出生方式比较特殊。当它作为生命体出现，不只是细胞在产生作用，同样会有识去投胎，带着那个识储藏的生命信息，才能构成完整的生命。就像某个猫被克隆了，并不等于原来的猫，其实是另一个生命。只是因为这种出生方式，所以在生命的物质层面，即基因信息上有更高的相似度。

_A:_ Human cloning is banned worldwide, for it raises numerous moral, ethical, and other problems, with consequences too dreadful to contemplate. Although Buddhist scriptures do not address this issue, the Dharma is not separate from worldly principles; since it is so harmful to sentient beings, Buddhism naturally opposes it. But in principle, a cloned human is also an independent living being, only one born in a special way. When it appears as a living being, it is not only cells at work; there is also a consciousness that goes to be reborn, carrying the life information stored by that consciousness, and only thus can a complete life be formed. Just as when a certain cat is cloned, it is not the original cat but actually another life. It is only because of this mode of birth that there is greater similarity at the material level of life, that is, in genetic information.

=== 轮回和解脱 / Samsara and Liberation <ch07-q05>

_问：_ 我对轮回的真实性有怀疑，原始佛教中就有轮回说吗？缘起性空是不是说，只有重新回到空，才能究竟解脱？

_Q:_ I have doubts about the reality of rebirth. Did the early Buddhist teachings already include the doctrine of rebirth? Does "dependent origination, nature of emptiness" mean that only by returning to emptiness can we attain ultimate liberation?

_答：_ 轮回是印度文化的共识。印度宗教众多，但普遍认可轮回说，认为轮回在时间上贯穿三世，在形态上包含六道，其本质都是痛苦的。生命的意义就在于解脱轮回。这种认识并非玄想，而是通过禅修证知的。佛陀证悟时，同样看到众生在轮回中不断流转。所以这也是佛法的基本思想，从原始佛教到大乘佛教是一以贯之的。

_A:_ Rebirth is a shared premise of Indian culture. India has many religions, but they generally accept rebirth, holding that it extends through the three periods of time and includes the six realms; its essence is suffering. The meaning of life lies in liberation from rebirth. This understanding is not mere speculation but is known through meditative realization. When the Buddha attained awakening, he too saw sentient beings ceaselessly revolving in rebirth. Therefore this is a fundamental teaching of the Dharma, consistent from early Buddhism to Mahayana Buddhism.

现在人接受唯物主义教育后，将此作为认识世界的唯一标准，看到才肯相信。但科学告诉我们，宇宙中除了可见的物质外，还有更多不可见的暗物质和暗能量。相比之下，可见物不过百分之五而已。而且科学还在不断发展中，即便从这个角度，我们也不能用现前认知，轻易否定自己看不到的部分。事实上，我们的认识系统有很大的局限性和错乱性。

Having received a materialist education, modern people take this as the only standard for understanding the world and believe only what they see. But science tells us that besides visible matter, the universe contains much more invisible dark matter and dark energy. By comparison, visible matter accounts for only about five percent. Moreover, science is still developing; even from this angle, we cannot use our present cognition to casually deny what we cannot see. In fact, our cognitive system has great limitations and distortions.

关于轮回，我通常会提出三个思考角度，一是天赋，二是缘分，三是命运。很多人会感到人有天赋、人与人之间存在缘分、人受命运支配，却无法解释为什么会这样，轮回说恰恰可以解答这些疑问。如果没有轮回，很多现象是无解的。

Regarding rebirth, I usually suggest three angles of reflection: first, innate talent; second, affinity or karmic connection; third, destiny. Many people sense that humans have innate talents, that affinities exist between people, and that people are subject to destiny, yet cannot explain why. The doctrine of rebirth can answer these questions. Without rebirth, many phenomena would be inexplicable.

缘起性空告诉我们，一切现象都是众缘和合的，其中没有不变的本质。佛法所说的缘起有两种，一是杂染缘起，一是清净缘起。凡夫生命以迷惑烦恼为基础，不断制造痛苦和轮回。但解脱轮回并不是什么都没了，不是进入顽空状态。因为我们还有佛性，当清净种子开显出来，将成就圆满的生命状态。

"Dependent origination, nature of emptiness" tells us that all phenomena arise from the convergence of conditions and contain no unchanging essence. The Dharma speaks of two kinds of dependent origination: impure dependent origination and pure dependent origination. The life of an ordinary being is based on delusion and afflictions, continually creating suffering and rebirth. But liberation from rebirth does not mean that everything is annihilated or that we enter a state of nihilistic emptiness. Because we also possess Buddha-nature, when pure seeds manifest, they will bring about a perfect state of life.

=== 缘起的生命观 / A Dependent-Origination View of Life <ch07-q06>

_问：_ 佛教认为世上不存在永恒的我，身心由色受想行识五蕴构成，其本质是空性。识也是空的吗？如果这样的话，究竟什么在六道轮回？

_Q:_ Buddhism holds that there is no eternal self in the world; body and mind are composed of the five aggregates of form, feeling, perception, formations, and consciousness, whose essence is emptiness. Is consciousness also empty? If so, what exactly wanders through the six realms of rebirth?

_答：_ 印度传统宗教认为有固定不变的神我，西方宗教也认为灵魂是永恒不变的实体。佛教讲无我，是否定在缘起生命安立的假我，认为生命是色、受、想、行、识五蕴组成的缘起现象，其中找不到作为实体的"我”。识同样是缘起的。

_A:_ Indian traditional religions believe in a fixed, unchanging _atman_; Western religions also hold that the soul is an eternal, unchanging entity. Buddhism speaks of no-self, denying the conventionally posited self in conditioned life. It regards life as a conditioned phenomenon composed of form, feeling, perception, formations, and consciousness, in which no "self" can be found as a substantial entity. Consciousness, too, is dependently originated.

但无我也不是人死如灯灭。佛教认为生命延续像流水一样，以第八阿赖耶识贯穿其中，这个过程是"相似相续，不断不常”的。相似相续，即色身从小到大，从成长到衰老，时刻都在变化。但它是前后相续的，不是立刻从孩子变成面目全非的老人。除了色身的变化，我们的观念、心态、人格也会随着生命经验的积累而更新，从不间断。可以说，阿赖耶识就像一个随时储存信息的超级硬盘，内容时刻都在变化。我们所有的想法和言行，不是发生后就结束的，还会在内心形成种子，成为未来生命延续的动力。

But no-self does not mean that when a person dies, it is like a lamp going out. Buddhism regards the continuation of life as being like a flowing stream, with the eighth Alaya consciousness running through it. This process is "similarly continuous, neither severed nor permanent." "Similarly continuous" means that the physical body changes constantly from childhood to adulthood to old age. Yet it is continuous from one moment to the next; a child does not suddenly become an unrecognizable old person. Besides changes in the physical body, our concepts, mental states, and personality also renew themselves through the accumulation of life experience without interruption. One could say that the Alaya consciousness is like a super hard drive that stores information at every moment, its contents constantly changing. All our thoughts, speech, and actions do not simply end when they occur; they also form seeds in the mind that become the driving force for the continuation of future lives.

生命虽然没有不变的实体，但有阿赖耶识为载体，所以出生时并不是一张白纸，而是以过去的积累为起点，又以现在的积累决定明天是什么。本着对自己的负责，我们也要谨言慎行。修行，就是不断改变生命内涵的过程。这是缘起的生命观，既不同于一般宗教的永恒论，也不同于唯物论的断灭论。

Although life has no unchanging entity, because it has the Alaya consciousness as its support, we are not born as a blank slate; rather, we start from past accumulation, and our present accumulation determines what tomorrow will be. Out of responsibility toward ourselves, we should also be careful in speech and conduct. Practice is the process of continually transforming the content of life. This is the dependent-origination view of life, which differs both from the eternalism of ordinary religions and from the annihilationism of materialism.

=== 业果怎么延续到来世 / How Do Karmic Results Extend to Future Lives? <ch07-q07>

_问：_ 人类造作善恶业所感召的果报，怎么会延续到来世？

_Q:_ How do the karmic rewards experienced by humans as a result of their good and evil actions extend to future lives?

_答：_ 任何一种行为都有两种结果，除了看得见的现象因果，还有看不见的心灵因果。从现象因果来说，有现报、生报、后报之分。比如干了坏事，可能马上感果，可能来生感果，也可能会经过更多生。因为从因到果需要缘的推动，即相关条件的成熟。但不论早晚，一定是会结果的。生活中也有类似情况，比如有人作了案马上被抓，也有的过几十年才被破案。不同的是，法律制裁可能有疏漏，但因果是绝对逃不掉的。因为这是事物发展的规律，不是谁可以逃避或操控的。

_A:_ Any action has two kinds of results: besides the visible phenomenal cause-and-effect, there is also the invisible mental cause-and-effect. In terms of phenomenal cause-and-effect, there are present reward, next-life reward, and later reward. For example, if we do something bad, the result may ripen in this life, in the next life, or after many lives. Because going from cause to result requires the impetus of conditions—that is, the maturation of relevant conditions. But sooner or later, it will certainly bear fruit. There are similar situations in daily life: some criminals are caught immediately, while others are not solved until decades later. The difference is that legal punishment may have loopholes, but karma absolutely cannot be escaped. This is because it is the law of how things develop, not something anyone can evade or manipulate.

从心灵因果来说，也有当下的和未来两种。当我们心生慈悲时，内心是温暖而快乐的，同时还会使慈悲品质随之增长。不断强化慈悲，会使生命得到提升，使这种力量延续到未来。生活中我们可以看到，有些人从小就心怀慈悲，愿意帮助他人，就是这种心行的等流果。

In terms of mental cause-and-effect, there are also immediate and future results. When a mind of compassion arises, the inner state is warm and joyful, and it also causes the quality of compassion to grow. Continually strengthening compassion elevates life and enables this force to extend into the future. In daily life we can see that some people are compassionate from childhood and willing to help others; this is the continuative result of such mental conduct.

=== 果报还自受 / One Receives the Karmic Results Oneself <ch07-q08>

_问：_ 《大宝积经》说，"假使经百劫，所作业不亡，因缘会遇时，果报还自受”。我去九华山时，看到供奉着十殿阎王。那么下地狱是不是相当于对以往业力的结算？如果结算过了，业力会不会结束？因果和儒家说的"积善之家必有余庆，积不善之家必有余殃”一样吗？

_Q:_ The _Maharatnakuta Sutra_ says, "Even after a hundred kalpas, the karma one creates does not perish; when conditions meet, its result is received by oneself." When I went to Mount Jiuhua, I saw the ten kings of the underworld enshrined there. Then is falling into hell equivalent to settling one's past karma? If it has been settled, does the karma come to an end? Is cause-and-effect the same as what Confucianism says: "A family that accumulates goodness will have surplus happiness; a family that accumulates evil will have surplus misfortune"?

_答：_ 这个偈颂告诉我们，如果不加对治，往昔所造的一切业力都要受报。下地狱只是某一部分的恶业成熟，这些业报完后就结束了，不会没完没了地继续。就像你欠债还钱后，相关债务就此了结。但无始以来，众生所造的业力无量无边，就像你欠了很多债，下地狱只是还了最大的债，但不是全部。众生随业流转，业报是逐步成熟的，不是一次性就能结算完的。在不加干预的前提下，业力会在条件具足后自然成熟，招感果报。如果担心未来苦果，首先是从今往后不造恶业，其次是通过忏悔来对治，把重业变成轻业，甚至彻底消除。

_A:_ This verse tells us that if we do not apply remedies, all the karma we created in the past must be experienced. Falling into hell is only the maturation of a certain portion of evil karma; once these karmic rewards are exhausted, they end and do not continue endlessly. It is like paying off a debt: once the relevant debt is repaid, the matter is closed. But since beginningless time, sentient beings have created boundless, immeasurable karma; it is like owing many debts. Falling into hell only repays the largest debt, not all of them. Sentient beings drift along with their karma, and karmic rewards ripen gradually; they cannot be settled all at once. Without intervention, karma will naturally mature when conditions are complete and bring about its karmic result. If we fear future suffering, first we should refrain from creating evil karma from now on, and second we should apply repentance as a remedy, transforming heavy karma into light karma or even eliminating it completely.

因果思想和儒家的"积善之家必有余庆，积不善之家必有余殃”有相通之处，但不完全一样。因果是基于个体生命的延续，而不是以家庭为单位的。当然，我们会投生什么家庭，招感好或不好的环境，也是自身业力决定的。从这个角度，儒家观点也说得通。

The idea of cause-and-effect is related to the Confucian saying, "A family that accumulates goodness will have surplus happiness; a family that accumulates evil will have surplus misfortune," but the two are not exactly the same. Cause-and-effect is based on the continuity of the individual life, not on the family as a unit. Of course, what kind of family we are reborn into and whether we encounter favorable or unfavorable circumstances are also determined by our own karma. From this angle, the Confucian view also makes sense.

== 八、人生正见 / VIII. Right View of Life <ch08>

=== 什么是真正的成功 / What Is True Success <ch08-q01>

_问：_ 我从小就胸怀大志，想当科学家造福人类，当医生救死扶伤，当教师培养人才，总之要成为对世界有贡献的人。但遇到佛法后，知道觉醒才是唯一的成功。我疑惑的是，即使改变世界的人也不算成功吗？

_Q:_ Since I was young I have cherished great aspirations—to become a scientist who benefits humanity, a doctor who heals the sick and saves the wounded, a teacher who cultivates talent; in short, to become someone who contributes to the world. But after encountering the Dharma, I realize that awakening is the only true success. I wonder: does this mean that even someone who changes the world is not considered successful?

_答：_ 这要看你用什么标准衡量成功。现代的成功标准比较物质，比如事业的大小、财富的多少、名望的高低、粉丝的多少等等。中国古代的成功标准是立德、立功、立言，更重视做人和对社会的贡献。而佛法所说的成功是自利利他，自觉觉他。一方面是于自身成就高尚人格，断除烦恼，圆满悲智；另一方面还能引领众生改善生命。我想，这是更究竟的成功，意义也更为长久。

_A:_ That depends on what standard you use to measure success. Modern standards tend to be materialistic: the size of one's career, the amount of wealth, the height of fame, the number of followers, and so on. In ancient China the standard was to establish virtue, merit, and worthy discourse, placing more importance on character and contribution to society. The Dharma's standard of success is benefiting self and others, awakening self and others. On the one hand, you perfect a noble personality, eliminate afflictions, and fulfill compassion and wisdom within yourself; on the other hand, you can guide living beings to improve their lives. I believe this is a more complete success, and its significance is more enduring.

至于当科学家、医生、教师，当然很有意义，但这和生命觉醒并不相违。如果在完善人格的基础上从事这些职业，将对世界作出更大贡献。否则的话，虽然职业本身很高尚，能够利益大众，但如果没有健全的心智，也会对自己和他人造成危害。职业只是一种工具，关键在于使用工具的人。

As for being a scientist, doctor, or teacher, these are certainly meaningful, and they do not conflict with awakening to life's truth. If you pursue these professions on the basis of perfecting your character, you will make an even greater contribution to the world. Otherwise, although the profession itself is noble and able to benefit the masses, without a sound mind it can still bring harm to yourself and others. A profession is merely a tool; what matters is the person who uses it.

=== 怎么找到人生使命 / How to Find Life's Mission <ch08-q02>

_问：_ 经过近十年对工作的全心投入，取得了一定成果，现在却感到失去了目标，工作和生活都没了之前的激情。也曾问自己到底想要什么，但内心空空的，如何找到人生使命？

_Q:_ After nearly ten years of wholehearted dedication to my work and achieving some results, I now feel that I have lost my goal; both work and life have lost the passion they once had. I have also asked myself what I truly want, but my heart feels empty. How can I find my life's mission?

_答：_ 学佛就是让我们看清人身价值，用好这个难得易失的身份。因为人有理性，能通过修行自觉觉他。除了这个终极目标，世间任何成就都是暂时的，经不起审视。没有达成目标时，可能还觉得很有奔头，到了之后却发现不过如此，所得并不是自己真正想要的。甚至有些哲学家和艺术家在功成名就后走上了绝路，为什么会这样？就是在达到某个目标后突然失去方向，四顾茫然，没有兴趣在世间苟活。所以我们要以开放的心态接受智慧文化，重新审视人生。如果看不到生命的高度，没有终极的目标，未来是没有出路的。

_A:_ Learning Buddhism helps us see the value of human life and make good use of this rare and easily lost form. Because human beings possess reason, they can, through practice, awaken themselves and awaken others. Apart from this ultimate goal, any worldly achievement is temporary and cannot withstand scrutiny. Before reaching a goal you may feel it is worth striving for; once you arrive, you find it is merely so-so, and what you gained is not what you truly wanted. Some philosophers and artists even took the road to ruin after achieving fame and success. Why? Because after reaching a certain goal they suddenly lost direction, looked around in bewilderment, and no longer had any interest in merely surviving in this world. Therefore we should accept the culture of wisdom with an open mind and re-examine life. If we cannot see the height of life and have no ultimate goal, there will be no way forward.

=== 何为人成即佛成 / What Does "When a Human Is Perfected, Buddhahood Is Perfected" Mean? <ch08-q03>

_问：_ 怎样理解"人成即佛成”？这样看成佛不是太简单了吗？

_Q:_ How should we understand "when a human is perfected, Buddhahood is perfected"? Doesn't this make becoming a Buddha too simple?

_答：_ 太虚大师所说的"人成即佛成”是有特定内涵的，是指圆满无限慈悲和智慧的人，而不是普通意义上的、世间认可的好人。比如儒家所说的人成，是成为儒家理想中的圣贤，但不是成佛。另外，这句话的提出有其特定的时代背景，是针对当时教界盛行的经忏化、鬼神化、来世化的误区现象而说，提出修行应从做人开始。事实上，佛陀就是以人的身份修行并最终成就的。从这个角度说，佛陀也是人，是圆满断德、智德和悲德的人，但必须遵循菩提道的修行才能圆满这些德行。

_A:_ What Master Taixu meant by "when a human is perfected, Buddhahood is perfected" has a specific meaning: it refers to a person who has perfected boundless compassion and wisdom, not merely a good person in the ordinary, worldly sense. For example, the Confucian idea of human perfection means becoming a sage or worthy in the Confucian ideal, but this is not Buddhahood. Moreover, this saying was put forward in a particular historical context to counter the prevailing misconceptions in Buddhist circles at the time—ritualization, spiritism, and otherworldliness—and to propose that cultivation should begin with being a genuine human being. In fact, the Buddha practiced and ultimately attained awakening in human form. From this perspective, the Buddha too is human: a person who has perfected the qualities of eradication, wisdom, and compassion, but one must follow the bodhi path to perfect these virtues.

=== 怎么都好，不需要烦恼 / It's All Fine; No Need for Afflictions <ch08-q04>

_问：_ 法师如此慈悲、如此智慧，还会不会生起烦恼？

_Q:_ Venerable, you are so compassionate and wise—do afflictions still arise in you?

_答：_ 每个人生活环境不一样，看问题的方式不一样，心态自然也不一样。出家人的环境相对单纯，没有各种关系的制约，也没有社会上那么复杂，本身少有引发烦恼的对境。而且我们做的事很大，我曾在微博中写过做大事的五大好处：一是不容易失败，因为不容易成功；二是不容易失业，因为短期内做不完；三是不容易执著，因为找不到执著点；四是做不好比较有借口，因为本来就不容易做好；五是不用着急，如果因缘不成熟，一个人干着急也没用。所以我一直觉得，出家人既没有得意也没有失意。有因缘时多做一些弘法利生的事，没有因缘时，自己静修也挺好的，而且非常重要。总的来说，怎么都好，不需要烦恼。

_A:_ Everyone's living environment is different, and so are the ways they look at things; naturally, their states of mind differ as well. The monastic environment is relatively simple, free from the constraints of various relationships and from the complexity of society; there are few conditions that provoke afflictions. Moreover, the work we do is vast. I once wrote on Weibo about the five advantages of doing great things: first, it is hard to fail, because it is hard to succeed; second, it is hard to become unemployed, because it cannot be finished in the short term; third, it is hard to become attached, because there is no point of attachment; fourth, there is an excuse for not doing it well, because it is not easy to do well in the first place; fifth, there is no need to hurry, because if the conditions are not ripe, anxiousness alone is useless. So I have always felt that monastics have neither elation nor dejection. When conditions allow, do more to propagate the Dharma and benefit sentient beings; when conditions do not allow, it is also good—and very important—to practice quietly by oneself. In short, whatever happens is fine; there is no need for afflictions.

=== 三观决定人生 / Our Outlook Determines Our Life <ch08-q05>

_问：_ 作为家长，怎么引导孩子建立三观？在什么阶段开始比较合适？

_Q:_ As a parent, how can I guide my child to develop the right outlook on life? At what stage is it appropriate to begin?

_答：_ 这几年开始强调三观，即人生观、世界观、价值观。其实学佛也是帮助我们建立三观。生活中每天都发生很多事，这些事能对我们产生什么影响，关键不在于事情本身，而在于我们怎么看待。此外，我们还要面临各种选择，从怎么待人处世，到寻找活着的意义，都离不开选择。而选择就意味着放弃，为什么要这个而不要那个？为什么这个重要而那个不重要？真正决定这些选择的还是三观。有些父母喜欢替孩子作决定，其实是将自己的三观强加给孩子，如果这个三观是错误的，就会给孩子带来负面影响，甚至是终生的痛苦。这样的例子比比皆是。

_A:_ In recent years people have begun to emphasize the "three outlooks": view of life, view of the world, and values. In fact, learning Buddhism also helps us establish these three outlooks. Every day many things happen in life. What effect they have on us depends not on the events themselves but on how we regard them. In addition, we constantly face choices: from how to treat people and handle affairs to finding the meaning of living, everything involves choice. To choose means to give up. Why take this and not that? Why is this important and that unimportant? What ultimately determines these choices is the three outlooks. Some parents like to make decisions for their children, but in doing so they are imposing their own outlooks on them. If these outlooks are wrong, they will have a negative impact on the child, even causing lifelong pain. Such examples are everywhere.

只有三观正确，我们才能过好每一天，所以这种教育非常重要，而且是成长过程中最为重要的教育。但在目前的教育体制中，这方面的内容有些薄弱。作为家长，如果能把智慧文化分享给孩子，帮助他们确立人生目标和道德准则，将使他们终身受益。建立三观不是学知识，在任何阶段都可以开始。通过自己的言传身教，让孩子在潜移默化中知道，应该成为什么样的人，什么该做什么不该做。这应该比单纯地讲道理效果更好。

Only with the right outlook can we live each day well. Therefore this kind of education is extremely important, indeed the most important education as we grow up. But under the present educational system this aspect is somewhat weak. As parents, if we can share the culture of wisdom with our children and help them establish life goals and moral standards, it will benefit them throughout their lives. Establishing the three outlooks is not the same as learning knowledge; it can begin at any stage. Through our own words and example, we can let children know imperceptibly what kind of person they should become and what they should and should not do. This should be more effective than merely lecturing.

== 九、人际关系 / IX. Interpersonal Relationships <ch09>

=== 尊重缘起，勇敢做自己 / Respect Dependent Origination and Be Brave Enough to Be Yourself <ch09-q01>

_问：_ 佛法告诉我们要放下，活在当下，但不得不与强势而偏执的师长相处时，如何摆脱压力，勇敢做自己？

_Q:_ The Dharma tells us to let go and live in the present, but when we have to get along with a forceful and opinionated teacher or elder, how can we free ourselves from pressure and be brave enough to be ourselves?

_答：_ 我们往往活在自己的标准中，当外境与此不符，就会心生抵触。尤其是对方强势而偏执时，更易让人产生压抑、愤怒等不良情绪，想不通"为什么这样”。如何面对？佛法所说的"随缘”特别重要。我们对随缘的理解可能偏于消极，以为是随便或逃避。其实，随缘是让我们尊重缘起的差别，不要执著自己的设定。每个生命都有各自的成长轨迹，他们会形成今天这样的观念、心态、性格，以这样的方式待人处世，并不是偶然的，而是代表长期以来的积累。当一个人的观念和心态有问题，自己就是首当其冲的受害者。如果理解到这一点，不论对方表现出什么态度，我们都能以平常心接纳，而不会感到伤害。因为他们本来就是这样，是身不由己的。

_A:_ We tend to live inside our own standards, and when outer circumstances don't match them, we feel resistance. This is especially true when the other person is forceful and opinionated; it more easily triggers oppressive feelings, anger, and other negative emotions, and we can't understand "why it has to be this way." How should we face this? What the Dharma calls "responding to conditions" is especially important. Our understanding of responding to conditions may tend toward the negative—we think it means being casual or escaping. Actually, responding to conditions asks us to respect the differences inherent in dependent origination and not cling to our own fixed ideas. Every life has its own path of growth; the views, mental states, and character they have formed today, and the way they deal with people and handle affairs, are not accidental but represent the accumulation of a long time. When a person's views and mental state are problematic, that person is the first and foremost victim. If we understand this, no matter what attitude the other person shows, we can accept it with an ordinary mind and won't feel hurt. Because that is simply how they are; they cannot help themselves.

接纳之后，可以带着慈悲和智慧，心平气和地与对方沟通。慈悲是为对方着想，希望他摆脱不良情绪；智慧是通过客观分析解决问题，而不是被情绪带偏。这样的沟通于己、于人、于事都有帮助。勇敢做自己，前提是有效解决问题，而不是带着抵触的心态回避，那只会搁置问题；也不是因为看不惯而指责对方，那只会激化矛盾。

After accepting, we can communicate with the other person calmly, with compassion and wisdom. Compassion means having their welfare at heart, hoping they can be free of negative emotions; wisdom means solving problems through objective analysis rather than being swayed by emotion. This kind of communication helps yourself, the other person, and the matter at hand. Being brave enough to be yourself presupposes effectively solving the problem. It is not avoiding out of resistance, which only leaves the problem unresolved; nor is it blaming the other person because you can't stand them, which only intensifies the conflict.

=== 沟通而不是对立 / Communicate, Rather Than Oppose <ch09-q02>

_问：_ 父母的控制，有时并不是我们想要的，但也不是我们能改变的。我们生在这样的家庭，势必和家人产生一些无明的因缘，有时甚至是恶缘。只能无奈地被这些因缘吞没吗？怎样既不伤害亲人，又能追求自己的人生理想？

_Q:_ The control our parents exert is sometimes not what we want, but it is also not something we can change. Being born into such a family, we are bound to create certain karmic conditions rooted in ignorance with family members, sometimes even adverse ones. Are we helplessly swallowed up by these conditions? How can we pursue our life ideals without hurting our loved ones?

_答：_ 生在不理想的家庭环境，确实会有诸多无奈，也是不少人的困境。这种情况下怎么办？首先要接纳现实而不是对立，否则只会使状况更糟。从佛法角度说，每个人出生在什么家庭，和自己往昔的业力有关。既然是自己造成的，没什么可抱怨的，只有在接纳的前提下调整。此外，父母对我们有养育之恩，从报恩的角度，更要多一层理解。

_A:_ Being born into a less-than-ideal family environment does bring much helplessness, and this is a dilemma many people face. What can we do? First, accept reality rather than set yourself in opposition, otherwise the situation will only get worse. From the Dharma perspective, the family into which each person is born is related to one's past karma. Since it is something we created ourselves, there is nothing to complain about; we can only adjust on the basis of acceptance. Moreover, our parents have shown us the kindness of raising us; from the standpoint of gratitude, we should understand them even more.

其次要思考人生，明确未来选择，清楚自己究竟要什么，不要什么。如果这是你经过理性思考和综合判断后的选择，就有信心和理由去说服父母。当然沟通方式也得善巧，要从他们最容易接受的角度切入，且不设立场，不带情绪。做到这几点，相信父母会对你多一些理解。因为他们的控制只是出于焦虑和对你的关心，并非恶意，这是沟通的基础。

Second, reflect on your life, clarify your future choices, and be clear about what you really want and don't want. If this is a choice you have made through rational reflection and sound judgment, you will have the confidence and reasons to persuade your parents. Of course, the way you communicate must also be skillful: start from the angle they can most easily accept, without taking a fixed position or bringing in emotions. If you can do this, I believe your parents will understand you better. Their control comes only from anxiety and concern for you, not from ill will; this is the foundation for communication.

=== 与父母相处的双全法 / A Way to Get Along with Parents That Benefits Both Sides <ch09-q03>

_问：_ 我想要不寻常的生活，而父母想让我过稳定的生活，为此有很大冲突，怎么寻求平衡？因为学佛和家人产生冲突怎么办？

_Q:_ I want an unconventional life, while my parents want me to live a stable one, and this causes a great deal of conflict. How can I find a balance? What should I do when conflicts with my family arise because of practicing Buddhism?

_答：_ 这种问题很多家庭都会发生，说不上谁对谁不对。你的想法有自己的心行背景，甚至是过去生的串习，从你来说是合理的；父母希望你稳定，是出于对你的爱和关心，从他们来说也是合理的。首先要理解他们，感恩父母的养育和关爱，而不是心生对立。然后在此基础上善巧沟通，最好展现出让父母放心的能力，让他们知道你的想法不是一时兴起，而是经过思考后的抉择，是有把握并对自己负责的。如果能让父母放心，相信他们会尊重你的选择。总之，从心态到做法都不能对立，否则一定会两败俱伤。

_A:_ This kind of problem happens in many families; it's not a matter of who is right and who is wrong. Your idea has its own mental background, even habitual tendencies carried over from past lives, so from your side it is reasonable; your parents want you to be stable out of love and concern for you, so from their side it is also reasonable. First, understand them and feel grateful for your parents' nurturing and care, rather than becoming adversarial. On that basis, communicate skillfully, and it is best to show your parents that you can set their minds at ease, letting them know that your idea is not a spur-of-the-moment impulse but a considered choice, one you are confident about and for which you take responsibility. If you can put their minds at ease, I believe they will respect your choice. In short, from attitude to action you must not set yourself in opposition; otherwise both sides will surely lose.

至于学佛，如果是偏重形式的信仰，当亲人尚未接受时，就在生活方式上有极大改变，容易导致对立。所以要本着自利利他的心和家人沟通，希望以自己的言行利益家人。随着我们的成长，家人看到这些正向改变，就会逐渐认可，甚至因此接受佛法。在三级修学学员中，这样的事例很多，属于润物细无声的渗透式影响。但在家人态度强硬且难以改变时，可以暂时回避。不论什么情况，都不能心生对立，而要本着信心、耐心、利他心面对。这本身就是重要的修行。事实上，亲密关系中的修行难度很大，但也不必气馁，当我们的智慧和慈悲增长了，办法总会越来越多。

As for practicing Buddhism, if your faith stresses external forms and you make big changes in your way of life before your family can accept it, this easily leads to opposition. So communicate with your family with the intention of benefiting yourself and others, hoping to benefit them through your words and actions. As we grow, our family will see these positive changes and gradually approve, even to the point of accepting the Dharma themselves. Among Three-Stage Practice students there are many such cases; it is a quiet, pervasive influence, like rain soaking into the earth unnoticed. But when family members are rigid and hard to change, you can temporarily step back. Whatever the situation, do not become adversarial; face it with faith, patience, and an altruistic mind. This itself is important practice. In fact, practicing within intimate relationships is very difficult, but there is no need to be discouraged; as our wisdom and compassion grow, there will always be more ways.

=== 想好自己要什么 / Be Clear About What You Want <ch09-q04>

_问：_ 大龄青年怎么面对父母的催婚？该用什么心态找生活伴侣？我担心恋爱结婚会影响修学，想得越多，越看不到理想的对象，应该放下这些去修行吗？

_Q:_ How should older unmarried young people face parental pressure to marry? What attitude should they have in looking for a life partner? I worry that romance and marriage will affect my practice, and the more I think about it, the harder it is to find an ideal partner. Should I let go of all this and just practice?

_答：_ 作为父母来说，有催婚的要求很正常。尤其在中国社会，这是非常普遍的，不催婚反而是超常的。对于在家人，佛教不会让你一定要结婚，也不会反对结婚，只是告诉你结婚后应该承担什么责任，同时不能有婚外恋等不良行为。

_A:_ For parents, pressing their children to marry is perfectly normal. Especially in Chinese society, this is very common; not pressuring them would actually be unusual. For lay practitioners, Buddhism does not say you must marry, nor does it oppose marriage; it only tells you what responsibilities you should take on after marriage and that you should not engage in extramarital affairs or other improper conduct.

结婚首先是你个人的选择，要自己作出决定。但婚姻生活是两个人，乃至两个家庭的事，一旦成了家，就要把家庭当作道场，在相处中学习接纳、包容、随喜，尽心承担由此带来的一切责任。如果你确实想追求出世解脱，献身佛法事业，全身心地修行，当然是很好的选择，但也要看到这条路上需要付出的努力。因为这并不是一种逃避，而是在承担更大的责任，是以利益众生为己任。

Marriage is first of all your personal choice; you must make the decision yourself. But married life involves two people, even two families; once you form a family, you should make the family your training ground, learning acceptance, inclusiveness, and rejoicing in others' merits in your interactions, and wholeheartedly assuming all the responsibilities that come with it. If you truly wish to seek transcendental liberation and devote yourself to the Dharma cause, wholeheartedly cultivating, that is of course an excellent choice, but you must also see the effort this path requires. Because this is not a form of escape; it is taking on a greater responsibility, making the welfare of sentient beings your mission.

所以结不结婚都是可以的，关键是你想清楚自己要什么。当然想的也不一定都能做到，否则就不会有那么多大龄青年了。关键是有随缘的智慧，审时度势，根据当下的因缘过好人生。这样的话，一切都是最好的安排。

So whether you marry or not is fine; the key is that you are clear about what you want. Of course, what you want is not always achievable—otherwise there wouldn't be so many older unmarried young people. The key is to have the wisdom to respond to conditions, to assess the situation, and to live well according to the conditions of the moment. In that case, everything is the best arrangement.

=== 和孩子共同成长的功课 / The Practice of Growing Together with Your Child <ch09-q05>

_问：_ 我学佛后放下了很多，但女儿的学习和生活习惯不好，这点我始终放不下，怎么办？

_Q:_ Since I began practicing Buddhism I have let go of a lot, but I still can't let go of my daughter's poor study and lifestyle habits. What should I do?

_答：_ 佛教讲的放下，并不是放弃。作为学佛人，我们首先要在社会上尽职尽责，所以教育儿女、孝顺父母、关爱同事、认真工作都是修行的一部分。关心孩子学习，引导她培养良好习惯，本身就是作为父母应该做的。关键在于，你是不是本着正确心态在做，方法是否有效。

_A:_ The "letting go" spoken of in Buddhism is not giving up. As Buddhist practitioners, we must first fulfill our responsibilities in society; therefore educating our children, honoring our parents, caring for our colleagues, and working diligently are all part of practice. Caring about your child's studies and guiding her to develop good habits are precisely what parents should do. The key is whether you are doing this with the right attitude and whether your methods are effective.

很多父母为孩子操碎了心，但效果并不理想，甚至让双方很痛苦。这就需要检讨自己的发心：究竟希望她健康成长，还是让她按自己的意愿发展？同时还要考量：对她的要求是否合理？是否在她的能力范围内？每个人都有自己的业力，不是那么容易改变的。即使佛菩萨在世，也只能度化有缘者，而不是所有人。

Many parents wear themselves out with worry over their children, yet the results are not ideal and may even cause suffering for both sides. At this point you need to examine your own motivation: do you truly want her to grow up healthy, or do you want her to develop according to your wishes? At the same time, consider whether your demands are reasonable and within her capacity. Every person has his or her own karma and is not that easy to change. Even with Buddhas and bodhisattvas present in the world, they can only liberate those with whom they have karmic connections, not everyone.

所以我们既要对孩子尽心尽力，也要尊重缘起，并有善巧方便，而不仅仅是按自己的意愿行事。当沟通效果不理想时，要及时调整。如果确实尽到全部努力，就应该接纳当下的状态。事实上，只要你的方法正确，总会对她有所帮助，只是暂时没达到你希望的状态而已，那就没必要纠结了。你可以将此作为自己的修行功课，和孩子共同成长。

So we should do our utmost for our children while also respecting dependent origination and using skillful means, rather than simply acting according to our own wishes. When communication does not go well, adjust in time. If you have truly done everything you can, you should accept the present state. In fact, as long as your methods are correct, they will always help her somewhat; it's just that they haven't yet reached the state you hoped for, so there is no need to become entangled. You can take this as your own practice lesson and grow together with your child.

=== 身教重于言教 / Example Teaches More Than Words <ch09-q06>

_问：_ 我们都知道教育要从娃娃做起，如何给孩子智慧的引导，让他们受益？

_Q:_ We all know that education should start when children are small. How can we give children wise guidance so that they benefit?

_答：_ 现在整个社会缺乏做人的教育，从学校到社会都是如此。更麻烦的是，外在诱惑和负面影响无处不在。作为孩子的第一课堂，父母确实要关心孩子的精神生活，加强道德素质的教育。我们希望孩子从智慧文化受益，前提是自己真正受益。当我们的观念、心态、人格、言行得到改善，贪嗔痴减少了，慈悲智慧增加了，本身就能为孩子传递正向的信息和能量。

_A:_ Society as a whole today lacks education in how to be a good person, from school to society at large. What is more troubling is that external temptations and negative influences are everywhere. As their first classroom, parents must indeed care about their children's spiritual life and strengthen their moral character. If we want our children to benefit from the culture of wisdom, the prerequisite is that we ourselves truly benefit. When our views, mental state, character, and conduct improve, when greed, hatred, and delusion decrease and compassion and wisdom increase, we naturally transmit positive messages and energy to our children.

孩子是感性的，除了讲道理之外，最重要的是以身作则，让孩子看到你是什么样的人，是怎么待人处世、处理问题的。这样的身教最为直接，往往胜于言教。在孩子出现问题时要及时纠正，和他一起探讨：为什么错了，应该怎么做？同时融入一些做人的道理，就会更有效。因为这不是空洞的说教，而是与具体问题相结合的。此外，还要营造和谐的家庭氛围，让孩子打开心扉，愿意和父母交流，知道这种交流对自己有益。这是帮助孩子健康成长的重要前提。

Children are feeling beings; apart from explaining reasoning, what matters most is to lead by example, letting them see what kind of person you are and how you treat others, handle affairs, and deal with problems. Such teaching by example is the most direct and often surpasses verbal instruction. When a child has a problem, correct it promptly and explore with her why it is wrong and what should be done; at the same time, weave in some principles of how to be a good person, and it will be more effective. Because this is not empty lecturing but connected to a concrete problem. In addition, create a harmonious family atmosphere so that children open their hearts and are willing to communicate with their parents, knowing that this communication is good for them. This is an important precondition for helping children grow up healthy.

=== 从想着自己到想着他人 / From Thinking of Yourself to Thinking of Others <ch09-q07>

_问：_ 我是独生子女，凡事想着自己，比较自私。法师说要发慈悲心，我感觉力不从心，不知怎么才能对他人慈悲？

_Q:_ I am an only child and think of myself in everything; I am rather selfish. The Dharma teacher says I should develop compassion, but I feel inadequate and don't know how to be compassionate toward others.

_答：_ 作为独生子女，往往被家人过度关注，百依百顺，养成以自我为中心的串习。但要知道，这种感觉对个人和社会都没好处。从个人来说，没有面对逆境的经验，走上社会后容易受挫；从社会来说，如果每个人都以自我为中心，就会引发矛盾和对立。不论是否学佛，与人相处时都要理解、尊重、包容。只有善待他人，才能得到相应回馈，否则会活得很辛苦。

_A:_ As an only child, we are often given excessive attention by the family and has every wish granted, developing self-centered habitual patterns. But you should know that this is not good for the individual or for society. For the individual, it means lacking experience of adversity, so after entering society one easily meets setbacks; for society, if everyone is self-centered, conflict and opposition will arise. Whether or not you practice Buddhism, in dealing with people you must understand, respect, and include others. Only by treating others well can you receive a corresponding response; otherwise life will be very hard.

认识到自我为中心的过患后，还要进一步认识到慈悲心给生命带来的利益。有人觉得慈悲是付出，是吃亏，事实上，慈悲会使你的心态得到优化，人际关系得到改善，使你变得更有福报，更受欢迎。最重要的是，使你的生命品质得到提升。我们想一想，自己喜欢自私还是慈悲的人？其实别人也是同样。至于怎么做，社会上说要换位思考，佛教则有自他相换法，就是把对自己的在乎转为对别人的在乎，把对别人的漠视转为对自己的漠视，通过中心的转移来摆脱自私。

After recognizing the harm of self-centeredness, you should further recognize the benefits compassion brings to life. Some people think compassion is giving and being taken advantage of; in fact, compassion refines your mental state, improves your relationships, makes you more blessed, and more welcome. Most importantly, it elevates the quality of your life. Think about it: do we prefer selfish or compassionate people? Others feel the same way. As for how to do it, society says to put yourself in others' shoes, while Buddhism has the practice of exchanging self and others: turn the care you have for yourself into care for others, and turn your indifference toward others into indifference toward yourself; by shifting the center of concern, you free yourself from selfishness.

=== 怎么让自己更包容 / How to Become More Tolerant <ch09-q08>

_问：_ 如果世上没有坏人坏事后会怎样？怎么才能包容所有人？

_Q:_ What would happen if there were no bad people or bad deeds in the world? How can we include everyone?

_答：_ 如果世上没有坏人坏事了，就会成为人人和乐的净土。佛教认为，一切显现都和众生的共业有关。当人类道德提升时，世界才会和谐，自然才会平衡。而道德堕落则会引发灾难。毁灭世界的大三灾（火烧初禅天、水淹二禅天、风吹三禅天），以及战争、瘟疫、饥馑的小三灾，都是因为坏人坏事招感的，其根本在于众生内心的贪嗔痴。

_A:_ If there were no bad people or bad deeds in the world, it would become a Pure Land where everyone lives in harmony and joy. Buddhism holds that all manifestations are related to the collective karma of sentient beings. When human morality rises, the world becomes harmonious and nature comes into balance. When morality declines, disasters are triggered. The three great disasters that destroy the world—fire burning up to the heaven of the first dhyāna, water flooding up to the heaven of the second dhyāna, and wind scattering up to the heaven of the third dhyāna—together with the three lesser disasters of war, plague, and famine, are brought about by bad people and bad deeds; their root lies in the greed, hatred, and delusion within sentient beings' minds.

至于包容，关键是发菩提心，建立"我要利益众生，帮助众生解除痛苦”的愿望。这就必须打开心量，接纳一切众生。不包容，往往是因为责人过严，且自以为是。从世间法来说，可能只是清高而已，未必算是问题；但从学佛来说，就是我执更强，是修行的极大障碍。我觉得，所谓的好人坏人，其实只是健康和不健康的人。如果对方的问题只是因为他不健康，是重病患者，我们就应该帮助他，而不是排斥他，有什么不能包容的呢？

As for tolerance, the key is to arouse bodhicitta and establish the wish "I will benefit sentient beings and help them be free from suffering." This requires you to open your mind and accept all beings. Not being tolerant usually comes from being too hard on others and thinking you are always right. In worldly terms, this may simply be aloofness and not necessarily a problem; but from the perspective of Buddhist practice, it means stronger attachment to self and is a great obstacle on the path. I think that so-called good and bad people are really just healthy and unhealthy people. If the other person's problem is simply that he is unhealthy, a seriously ill patient, then we should help him rather than reject him—what is there that cannot be tolerated?

== 十、心行成长 / X. Growth of Mind and Conduct <ch10>

=== 烦恼来了怎么办 / What to Do When Afflictions Arise <ch10-q01>

_问：_ 我最近在生活中遇到很多问题，束手无策，一步步向烦恼让步。这种身不由己的感觉非常难受，渴望获得平静，这是不是善法欲？应该怎么解决烦恼？

_Q:_ Lately I have encountered many problems in life. I feel helpless and keep giving ground to affliction step by step. This feeling of being unable to help myself is truly painful. I long for peace. Is this wholesome desire? How should I resolve afflictions?

_答：_ 所谓烦恼，烦是扰，恼是乱，就是扰乱内心的负面情绪，让我们不得自在，不得安宁，活得很累很痛苦。渴望解决烦恼的愿望，我想很多人有过，尤其是身处烦恼时，这种感觉会特别强烈，为此会不惜代价。至于是不是善法欲，关键看你用什么方法解决。世人有了烦恼会借酒消愁、沉迷游戏，或吃喝玩乐、购物减压。这些方式多少能起到缓解效果，但只是暂时逃避，无法从根本上解决问题，还会带来种种副作用。

_A:_ The word _affliction_ means disturbance: "fan" is to agitate, and "nao" is to disorder. It is a negative mental state that disturbs the mind, leaving us neither free nor at rest, living in exhaustion and pain. Many of us have longed to be free from affliction. That longing becomes especially strong when we're caught in it, and we may be willing to pay any price. Whether this is wholesome desire depends on how we try to deal with it. When ordinary people have afflictions, they may drown their sorrows in drink, lose themselves in games, or seek relief through eating, drinking, shopping, and entertainment. These methods may offer some temporary relief, but they are only escape; they cannot solve the problem at its root, and they bring many side effects.

解决烦恼，关键要看清烦恼是怎么产生的。事实上，很多烦恼来自观念。世间种种能对我们产生什么影响，并不在于事情本身，而在于我们怎么看待。所以要了解哪些观念不制造烦恼，进而能对治烦恼。佛法将思维分为两种：一是非理作意，即错误的思维方式；一是如理作意，即智慧的思维方式。如果以错误思维看问题，时时处处都会制造烦恼。反之，不论遇到什么对境，都能安然接纳并寻找智慧的解决之道。所以思维方式非常重要，可以阻断烦恼，不让它有现行机会。但要彻底断除烦恼和产生烦恼的根源，必须依正见及禅修证悟空性。

To resolve afflictions, the key is to see clearly how they arise. Many afflictions come from our views. How things in the world affect us depends not on the things themselves, but on how we regard them. Therefore we need to understand which views do not create afflictions, so that we can counteract them. The Dharma describes two ways of attending to experience: unwise attention, which is wrong thinking, and wise attention, which is right thinking. If we look at problems with wrong thinking, we create afflictions at every turn. Conversely, whatever circumstances we meet, we can accept them peacefully and seek a wise solution. Thus the way of thinking is very important; it can stop afflictions before they have a chance to manifest. But to completely cut off afflictions and their root causes, we must rely on right view and realize emptiness through meditation.

=== 接纳逆境才能止损 / Accepting Adversity Is the Way to Stop the Loss <ch10-q02>

_问：_ 我是心理工作者，曾在汶川地震时做心理援助工作，为许多丧失子女的家庭疏导情绪，帮助他们走过悲伤，但无法回答这样的问题：为什么这事发生在我身上？从因果来说，难道是他们罪有应得吗？

_Q:_ I work in mental health. During the Wenchuan earthquake I provided psychological aid, helping many families who had lost children work through their grief. But I could not answer this question: "Why did this happen to me?" From the perspective of cause and effect, were they simply getting what they deserved?

_答：_ 佛法是以因果和无常看待世间一切悲欢离合，但当对方没有这样的认识，又处于极度悲痛时，这种说法听起来会感觉很无情。所以要善巧表达，以免对方受到刺激，或感情上不能接受。从今生的结果看，这种死亡对自己和家人都是莫大的不幸。但从轮回来看，死亡并不是结束，也是新生命的开始。如果他的善业能成熟，去处未必不如现在。

_A:_ The Dharma views all the joys and sorrows, reunions and partings of the world through cause and effect and impermanence. But when the other person does not have such understanding and is in extreme grief, this way of speaking can sound heartless. Therefore we must express it skillfully, so as not to upset them or leave them emotionally unable to accept it. Looking at the result in this present life, such a death is a great misfortune for oneself and one's family. But in terms of samsara, death is not an end; it is also the beginning of a new life. If their wholesome karma ripens, where they go may not be worse than their present situation.

此外，世间每天会发生很多天灾人祸，所谓人生不如意十之八九。如果不接纳逆境，就会像佛经所说的那样，被一支毒箭射中后，又被第二支毒箭射中，造成更大的伤害。在这样的情况下，接纳才是及时止损的有效办法。如果能由此认识无常，转逆境为修行机缘，不仅自己可以走出悲伤，也有机会利益去世的亲人。

Moreover, every day in the world there are natural and man-made disasters; as the saying goes, life does not go as we wish nine times out of ten. If we do not accept adversity, it is as the sutras say: after being struck by one poisoned arrow, we are struck by a second, causing greater harm. In such circumstances, acceptance is how we keep the pain from getting worse. If through this we can come to know impermanence and turn adversity into an opportunity for practice, we can not only emerge from grief ourselves but also benefit the departed loved ones.

=== 处理情绪的两项基本原则 / Two Basic Principles for Handling Emotions <ch10-q03>

_问：_ 佛法认为情绪是假我，要和它保持距离。但普通人面对情绪时会陷入其中，无法保持距离。心理学则认为，采用压抑、隔离等情绪防御机制，会造成情感淡漠、郁结等问题。对普通人来说，有没有普世的方法处理不良情绪？法师在讲座中说，要开启生命纯净的直觉，这和潜意识有关吗？

_Q:_ The Dharma regards emotions as the false self and says we should keep our distance from them. But ordinary people get caught up in emotions and cannot keep their distance. Psychology holds that repression, isolation, and other emotional defense mechanisms can cause emotional numbness, stagnation, and other problems. For ordinary people, is there a universal way to handle negative emotions? In a lecture the teacher said we should open the pure intuition of life. Is this related to the subconscious?

_答：_ 对待负面情绪，最基本的有两点。首先是不制造情绪。负面情绪不是从天上掉下来的，究其根源，主要来自我们的观念和思维方式。其实不如意是人生常态，不能正确看待，才会产生愤怒、焦虑、没有安全感等不良情绪。事实上，这些情绪对解决问题毫无帮助，只会让人失去理智，让事情变得更糟。所以要改变观念，在面对问题时不起情绪，就像疾病防控一样，预防才是关键。

_A:_ In dealing with negative emotions, there are two basic principles. First, do not create emotions. Negative emotions do not fall from the sky; traced to their root, they come mainly from our views and ways of thinking. Life doesn't go the way we want—this is normal. When we can't see this clearly, we feel anger, anxiety, insecurity, and so on. These emotions don't help solve problems; they just make us lose our heads and make things worse. So we need to change the way we see things, so we don't get emotional when problems come up. Like disease prevention, stopping it before it starts is key.

其次是不积累情绪。情绪是会增长的，不论愤怒、嫉妒还是焦虑，当它产生后，如果不能如理思维，而是继续非理作意，就会给负面情绪提供养分，使之不断增长。就像你讨厌一个人时，会制造很多讨厌的理由，越想越觉得讨厌。所以有了负面情绪时，不要纵容，不要给它成长空间，而要学会审视：为什么产生这些情绪？情绪到底是什么？其存在是否合理？当我们能静下心来看着它，情绪就会像被灭活的病毒，不再具有破坏力。

Second, do not accumulate emotions. Emotions can grow. Whether it's anger, jealousy, or anxiety, once it arises, if we keep attending to it unwisely instead of thinking wisely, we feed it and it grows. Just as when you dislike someone, you come up with many reasons to dislike them, and the more you think about it the more you dislike them. Therefore, when negative emotions arise, do not indulge them or give them room to grow. Instead, learn to examine them: Why do these emotions arise? What exactly is emotion? Is its existence reasonable? When we can calmly observe it, the emotion becomes like an inactivated virus and can no longer harm us.

最重要的是通过禅修开启观智，才能彻底消除情绪。当然这有难度。对普通人来说，前两点都是可以做到的。至于纯净的直觉，不能简单等同于潜意识。因为潜意识有不同层次，比如第七末那识和第八阿赖耶识就属于潜意识，但都在妄心系统。只有超越妄心，才能进入纯净的直觉。

Most important, meditation opens the wisdom of insight; only then can we completely eliminate emotions. Of course this is difficult. For ordinary people, the first two things are possible. As for pure intuition, it cannot simply be identified with the subconscious. The subconscious has different levels; for example, the seventh Manas consciousness and the eighth Alaya consciousness belong to the subconscious, but both are within the system of the deluded mind. Only by transcending the deluded mind can we enter pure intuition.

=== 不自大，不自卑 / Neither Arrogant Nor Inferior <ch10-q04>

_问：_ 我本来自我感觉很好，后来受他人影响，开始变得有些自卑，而且特别在意别人的看法，怎么调整心态？

_Q:_ I used to feel quite good about myself, but later, influenced by others, I began to feel somewhat inferior and especially care about what others think. How should I adjust my mindset?

_答：_ 人往往看不清自己，就会不自觉地和人比较。有人爱用自己的长处和别人的不足比，就会自我感觉良好，甚至盲目自大；也有人总是夸大自己的不足，以此否定自己。这都不是如实的认知，也反映了对自身的不接纳。每个人都有自己的长处和不足，这很正常，因为生命的积累不同。了解自己当下的状态，如实接纳，才能在此基础上进步。否则，自大者会故步自封，自卑者会妄自菲薄，都不利于生命的优化。

_A:_ People often cannot see themselves clearly and unconsciously compare themselves with others. Some like to compare their strengths with others' weaknesses, which makes them feel good about themselves, even blindly arrogant. Others always exaggerate their own shortcomings and use them to negate themselves. Neither is a true perception, and both reflect non-acceptance of oneself. Everyone has strengths and shortcomings; this is normal, because each person's life experience is different. Only by understanding our present state and accepting it as it is can we progress on that basis. Otherwise, arrogant people get stuck in their ways, and self-deprecating people sell themselves short. Neither helps us flourish.

在意别人的看法，同样是因为看不清自己，对人生追求不明确，不知道自己能做什么，也不知道自己究竟要什么不要什么，就容易受外界影响。如果能通过学佛树立正见，对人生有自主选择，就不会那么在意了。别人有什么看法，我们可以用来检查自己，有则改之，无则加勉。此外不必多想什么，否则只会增加无谓的烦恼。学佛的根本就在于去除我执，如果死死抱住这个"我”不放，连别人的看法都要在意，痛苦是没完没了的。

Caring about others' opinions likewise comes from not seeing oneself clearly. When we don't know what we want from life, what we can do, or even what we want and don't want, we easily get swayed by the world around us. If through learning Buddhism we establish right view and make autonomous choices for our lives, we will not care so much. We can use others' opinions to examine ourselves: if there is something to correct, correct it; if not, take it as encouragement. Beyond that, there is no need to think too much, or it will only add unnecessary affliction. The root of learning Buddhism lies in removing self-grasping. If we stubbornly hold on to this "self," even caring about others' opinions, our suffering will never end.

=== 让时间的使用更有价值 / Making the Use of Time More Valuable <ch10-q05>

_问：_ 参加修学一年来，我发生了巨大改变，也感化家人皈依了。现在我觉得应该把精力更多地投入修学，但在生活中，我既是女儿，也是母亲和妻子，还是单位员工，感觉时间难以权衡。比如看护宝宝，如果我要修学，就得把孩子交给老人，但站在孝敬老人的角度，又不该给他们增加负担，怎么办？

_Q:_ Since joining the practice program a year ago, I have changed tremendously and also influenced my family to take refuge. Now I feel I should devote more energy to practice, but in life I am a daughter, a mother, a wife, and an employee. I find it hard to balance my time. For example, in caring for the baby, if I want to practice, I have to leave the child with the elderly, but out of filial respect I should not add to their burden. What should I do?

_答：_ 在家居士都有家庭、工作、社会等方面的责任，有时会觉得，学佛和这些世俗责任有冲突。这主要因为还是初学，没能很好地运用佛法。当我们通过修学变得更有智慧和慈悲，就能更善巧地处理问题。生活中的很多事没有标准答案，而要根据当下的因缘综合判断。比如让老人看孩子，不见得是不孝顺，也可以是让老人享受天伦之乐。究竟属于哪一种，要取决于具体情况，以及你在处理时的言行、态度和方式方法。

_A:_ Lay practitioners all have responsibilities in family, work, and society, and sometimes feel that learning Buddhism conflicts with these worldly duties. This is usually because we're still beginners and haven't yet learned to apply the Dharma well. As we become wiser and more compassionate through practice, we can handle matters more skillfully. Many things in life have no standard answer; we must judge according to the conditions of the moment. For example, having elderly parents look after the child is not necessarily unfilial; it can also be a way for them to enjoy family happiness. Which it is depends on the specific situation and on your words, actions, attitude, and manner in handling it.

此外，当我们的心没能安住于法时，就会妄想纷飞。很多人每天忙来忙去，大量时间用于妄想，用于玩手机、聊天、逛街，或是制造各种无谓的应酬。学佛后生活变得简单，可以省出大量时间来学习，做利益众生的事。不仅如此，当你的智慧增长了，即使看孩子、做家务，也可以是修行的一部分，和学佛并不矛盾。如果是和人相处，就用来训练理解、陪伴、关爱；如果是单纯做事，就用来训练觉知和安住当下。当时间使用得更有价值，你的生命就会更有价值。

Moreover, when our minds have not settled into the Dharma, random thoughts fly about. Many people busily pass their days, spending much time on wandering thoughts, playing with phones, chatting, shopping, or creating all kinds of unnecessary social engagements. After learning Buddhism, life becomes simpler and we can save a great deal of time for study and for doing things that benefit sentient beings. Not only that, when your wisdom grows, even caring for children and doing housework can be part of practice and is not in conflict with learning Buddhism. When relating to others, use it to train understanding, companionship, and care; when simply doing tasks, use it to train awareness and abiding in the present moment. When time is used more wisely, your life becomes more valuable.

=== 鬼也是众生，别怕 / Ghosts Are Sentient Beings Too; Don't Be Afraid <ch10-q06>

_问：_ 学佛后相信有六道轮回，但一想到鬼道众生，内心就特别害怕和抵触，怎么对治？

_Q:_ After learning Buddhism I believe in the six realms of rebirth, but whenever I think of beings in the ghost realm, I feel especially afraid and resistant. How can I counter this?

_答：_ 怕鬼一方面是因为看不见，加上传说和文艺作品中的可怕描述，想象空间很大，就会引发恐惧；另一方面是因为自身正念不够强大，容易受到侵扰。关于这个问题，可以念诵佛号或三皈依，观想三宝功德在护佑我们。这些圣号有着强大的能量和加持力，可以安顿身心，驱除恐惧。

_A:_ We're partly afraid of ghosts because we can't see them. Add frightening descriptions from legends and stories, and our imagination runs wild. It is also because our own right mindfulness is not strong enough and we are easily disturbed. Regarding this, we can recite the Buddha's name or the Three Refuges, and visualize the merit of the Three Jewels protecting us. These holy names have great power and blessings; they can settle body and mind and dispel fear.

进而还要思考，鬼也属于六道众生，是学佛人发愿帮助的对象之一。他们成为鬼，是恶业招感的苦果，已经很不幸了，有什么可害怕的？如果我们充满慈悲，无论遇到什么众生，内心只有慈悲，没有恐惧也没有仇恨。反之，才会被恐惧或不良情绪抓住。所以让什么念头占据内心很重要，如果能时时发起菩提心，修习慈悲心，就会充满力量。

Furthermore, we should reflect that ghosts also belong to the six realms and are among the beings that Buddhists vow to help. Their becoming ghosts is the bitter fruit of unwholesome karma; they are already most unfortunate. What is there to fear? If we are filled with compassion, whatever beings we encounter, our minds will hold only compassion, with no fear and no hatred. It is only when we lack compassion that we are seized by fear or negative emotions. Therefore, what thoughts occupy the mind is very important. If we can constantly arouse bodhicitta and cultivate compassion, we will be filled with strength.

=== 让智慧照入梦境 / Letting Wisdom Shine into Dreams <ch10-q07>

_问：_ 佛教怎么看待人的梦？

_Q:_ How does Buddhism regard human dreams?

济群法师：通常来说，梦是妄想、迷惑的显现，所以佛教中有个词叫作"颠倒梦想”。从佛教观点来看，我们的整个人生就是一场梦，而不仅仅是在睡眠状态下才会做梦。至于通常所说的梦，和意识活动有关。此外，还可能受诸多因素影响：有时是一些鬼神进入梦的状态；有时梦中也能感得佛菩萨示现；有时修行达到一定程度，梦中会出现相应境界；有时是意识超前的感知，在梦中预知一些将要发生的事；有时是过去生留下的特别强大的种子，会在今生乃至很多生中不断以梦境显现相关影像，等等，不一而足。

Master Jiqun: Generally speaking, dreams are the manifestation of deluded, confused thinking; therefore Buddhism has the expression "inverted dreams." From the Buddhist point of view, our whole life is a dream, not only the dreams we have while asleep. As for ordinary dreams, they are related to mental activity. In addition, many things can influence them. Sometimes spirits enter our dreams. Sometimes Buddhas and bodhisattvas appear to us in dreams. Sometimes, when our practice reaches a certain level, corresponding states appear. Sometimes our consciousness gets a premonition and we know in a dream what is about to happen. Sometimes exceptionally powerful seeds from past lives keep appearing in dreams throughout this life and many lives to come. The list goes on.

_问：_ 《金刚经》说"一切有为法，如梦幻泡影”，物理学家也说，宇宙是全息投影。但这一切太真实了，我们体验到的痛苦和快乐让人沉浸其中，无法自拔。怎样才能把梦境和现实区别开？

_Q:_ The _Diamond Sutra_ says, "All conditioned phenomena are like a dream, an illusion, a bubble, a shadow." Physicists also say the universe is a holographic projection. But all this is too real; the suffering and joy we experience draw us in and we cannot free ourselves. How can we distinguish dreams from reality?

_答：_ 当我们做梦时，一切也很真实，醒来才知道之前是梦境。我们现在身处无明大梦，在觉醒之前，同样觉得这个梦很真实，会全身心地投入其中，为之欢喜、忧伤、恐惧。只有醒来后才能看清，所经历的一切不过是梦中影像，颠倒妄想。但仅仅依靠意识的思维很难分清，必须通过修行开启观智，才能见到诸法的如实相。佛陀就是在觉醒后，把他的所见告诉我们，以此唤醒沉睡中的众生。我们听了这些道理，还要通过修行去证悟，否则还是在梦中，无法明白佛陀说的是什么。

_A:_ When we are dreaming, everything is also very real; only upon waking do we realize it was a dream. We are now in the great dream of ignorance; before awakening, we likewise feel this dream is very real and throw ourselves into it wholeheartedly, feeling joy, sorrow, and fear because of it. Only after awakening can we see clearly that all we experienced was nothing but dream-images, inverted delusion. But it is hard to distinguish them by conscious thinking alone; we must open insight wisdom through practice in order to see the true suchness of all phenomena. The Buddha, after his awakening, told us what he saw in order to awaken sentient beings still asleep. Having heard these teachings, we must still realize them through practice; otherwise we remain in the dream and cannot understand what the Buddha was saying.

== 十一、自利利他 / XI. Benefiting Self and Others <ch11>

=== 不忘出离心，常修菩提心 / Never Forget Renunciation; Always Cultivate Bodhicitta <ch11-q01>

_问：_ 佛法更重视出世还是入世？两种修行有先后次第吗？

_Q:_ Does Buddhism place greater emphasis on transcending the world or engaging in it? Are these two approaches sequential?

_答：_ 出世和入世，分别对应出离心和菩提心。表面看来，出和入是对立的。事实上，出离并不是离开世间或躲进深山，而是看透五欲六尘的虚幻，摆脱对世间的贪著，这才是轮回的真正根源。佛教以解脱为三乘修行的根本，不仅发出离心的声闻要解脱，发菩提心的菩萨同样需要解脱。只有断除烦恼，以超然的心态入世，才能更好地帮助众生。否则很可能是泥菩萨，还没帮到别人，自己就沦陷了。所以出世和入世是统一的。从根本上，都需要有出世之心，要解脱轮回。但入世是菩萨利他的途径，如果不和众生结缘，何以度化他们？

_A:_ Transcending the world and engaging in it correspond to renunciation and _bodhicitta_. On the surface, leaving and entering appear to be opposites. Renunciation does not mean abandoning the world or hiding in the mountains; rather, it means seeing through the illusory nature of the five sensual pleasures and the six objects of perception, and freeing ourselves from attachment to the world. This attachment is the true root of _samsara_. Buddhism regards liberation as the foundation of practice for all three vehicles. Not only _shravakas_ who arouse renunciation seek liberation; _bodhisattvas_ who arouse bodhicitta likewise need liberation. Only by eliminating afflictions and entering the world with a transcendent mind can we better help sentient beings. Otherwise, we are likely to be like a clay bodhisattva—before helping others, we ourselves collapse. Thus transcendence and engagement are unified. Fundamentally, both require a mind of transcendence, a resolve to liberate from samsara. Yet engaging in the world is the bodhisattva's path of benefiting others; without forming karmic bonds with sentient beings, how could we liberate them?

至于先后次第，虽然菩提心是以出离心为基础，但并不是说，必须出离心圆满之后再修菩提心。尤其是对在家居士来说，有了一定基础后，就可以同时进行，不忘出离心，常修菩提心。当然，如果有条件静修一段时间会更好，心行可以更稳定。

As for sequence, although bodhicitta is founded on renunciation, this does not mean we must perfect renunciation before cultivating bodhicitta. This is especially true for lay practitioners: once a certain foundation is established, the two can be practiced together—do not forget renunciation, and cultivate bodhicitta constantly. Of course, if conditions allow for a period of quiet retreat, the mind will become more stable.

=== 利他心的度 / The Measure of Altruistic Intention <ch11-q02>

_问：_ 学佛要自利利他，但觉得自己功力不够，帮不了几位朋友，有时还受到伤害。利他心应该把握到什么程度？自己功力不够时怎么化解？

_Q:_ Buddhist practice should benefit both self and others, yet I feel my ability is insufficient. I cannot help a few friends and sometimes even get hurt. To what extent should altruism be pursued? How do I resolve this when my capacity is inadequate?

_答：_ 利他的难度在于，会和我执发生冲突。所以生起利他心的前提，是真正认识到我执的过患和利他的意义。这样的认知非常重要。至于在利他过程中有没有合适的度，不能一概而论，和个人的修行、定位、能力有关。

_A:_ The difficulty of benefiting others lies in its conflict with self-grasping. Therefore, the prerequisite for arousing altruism is truly recognizing the faults of self-grasping and the value of benefiting others. Such understanding is essential. As for the right measure, it cannot be generalized; it depends on one's practice, orientation, and capacity.

定位就是你对自己的要求，是不是想学做菩萨，能力则是你目前可以做到的最大程度，不同人会存在差异。比如菩萨戒说到，菩萨可以为利他献出自己的头目手足乃至生命，但这指的是登地菩萨，已经见到空性。在达到相应境界前，这么做反而有副作用。因为你对自己身体还很执著，献身之后会苦恼甚至退心，所以要衡量自己的能力。

Orientation means the standard you set for yourself—whether you aspire to train as a bodhisattva. Capacity means the maximum you can do at present, which varies from person to person. For example, the bodhisattva precepts state that a bodhisattva may give away their head, eyes, hands, feet, and even life for the sake of benefiting others. But this refers to a bodhisattva who has attained the grounds and realized _emptiness_. Before reaching that level, doing so would have adverse effects, because you are still attached to your body, and after such sacrifice you might become distressed or even lose heart. So you must measure your capacity.

从佛法角度看，提升自己也是一种利他，当然前提是带着利他心提升自己。大乘皈敬颂的"我以所修诸功德，为利有情愿成佛”，就是告诉我们，修功德、成佛道都是为了更好地帮助众生。具备这样的见地后，可以根据实际情况综合抉择，并不一定要对他人百依百顺。在自己能力范围内就尽力做，否则也可以婉言拒绝并说明理由，不必过分勉强。当我们的发心、能力、境界差距较大时，强迫自己做些什么，于人于己都没有好处。当然，也可以在现有基础上适当突破一点，这样会进步更快。

From the Buddhist perspective, improving yourself is also a form of benefiting others, provided it is done with an altruistic intention. The Mahayana verse of refuge, "May whatever merit I accumulate be dedicated to the welfare of sentient beings so that I may attain buddhahood," tells us that cultivating merit and pursuing buddhahood are for the sake of better helping sentient beings. With such a view, you can make a balanced decision according to circumstances and need not obey others' every wish. Do your best within your capacity; otherwise, you may politely decline and explain why, without forcing yourself. When there is a large gap between aspiration, capacity, and realization, forcing ourselves to act is harmful to both others and ourselves. Of course, you may also stretch yourself a little beyond your current level; this will lead to faster progress.

=== 愿心要真要切 / Aspiration Must Be Genuine and Earnest <ch11-q03>

_问：_ 一直有很多人关心我、帮助我，但在他们困难时，我却无力帮助他们，感觉特别愧疚，不知该怎么办。如何在我力所能及的范围内报恩？什么才是究竟的报恩方式？

_Q:_ Many people have cared for and helped me, yet when they face difficulties I feel powerless to help them. I feel especially guilty and do not know what to do. How can I repay their kindness within my ability? What is the ultimate way to repay kindness?

_答：_ 首先要根据自身能力尽量去做，同时要发菩提心，建立高尚的利他愿望。如果这种愿望非常强烈，能力会很快提高。就像带着目标去学习那样，有源源不断的动力。生起这样的愿心，利他的因缘也会不断出现。事实上，不论能力是大是小，只要有心，总能做点什么。有时哪怕没做什么具体的事，也能给对方传递慈悲，让对方感到温暖和关怀。关键是这份愿心要真切，确实是这么想，也强烈想要去做。不然的话，可能想过说过，感觉自己是个知恩图报的人就结束了，并没有进一步付诸行动。这是不行的。究竟的报恩方式，当然是引导他们通过学佛转迷为悟，彻底摆脱痛苦。但前提是你自己真正从佛法受益，这样才有说服力。

_A:_ First, do what you can, and at the same time arouse bodhicitta and establish a noble altruistic aspiration. When this aspiration is strong, your ability will quickly grow. It is like studying with a clear goal: the motivation is inexhaustible. Once such an aspiration arises, the conditions for benefiting others will keep appearing. Regardless of ability large or small, as long as there is the intention, there is always something we can do. Sometimes even without doing anything concrete, you can convey compassion to the other person and make them feel warmth and care. The key is that this aspiration must be genuine—truly felt and strongly desired. Otherwise, you may merely think or speak about it, feel that you are a grateful person, and stop there without taking further action. That is not enough. The ultimate way to repay kindness, of course, is to guide them through Buddhist practice to turn from delusion to awakening and thoroughly transcend suffering. But this requires that you yourself have truly benefited from the Dharma; only then will you be convincing.

=== 因为理解，所以慈悲 / Because of Understanding, There Is Compassion <ch11-q04>

_问：_ 我知道学佛人要有悲心，平时看到流浪动物就很想帮助，但看到需要帮助的人，反而没有帮助小动物的心那么强烈，只是觉得应该去做。这是为什么？

_Q:_ I know that Buddhists should have compassion. When I see stray animals, I want to help them, but when I see people in need, the urge is not as strong as toward small animals; I only feel that I should help. Why is this?

_答：_ 这种现象其实不在少数，不少人会对动物心生慈悲，对人却不容易。原因有很多，主要是现在社会风气不好，负面新闻层出不穷，如助人者反被讹诈等，所以我们面对求助时，会本能地心生防备，生怕引发后续问题，结果慈悲就被各种担心取而代之了。此外，相对流浪动物来说，帮助人通常更复杂也难度更大，当慈悲不够强大时，就会有帮什么不帮什么的分别。即便同样是帮动物，多数人会帮猫而不会帮老虎，因为后者太难了，必须能力很强的人才帮得了。

_A:_ This is fairly common. Many people feel compassion toward animals but find it harder to feel the same toward people. There are many reasons. Mainly, social values today are declining, and negative news is endless—such as those who help others being falsely accused. So when faced with a request for help, we instinctively become defensive, afraid of subsequent problems, and compassion is replaced by various worries. Moreover, compared with stray animals, helping people is usually more complex and difficult. When compassion is not strong enough, we start to discriminate between what to help and what not to help. Even among animals, most people would help a cat but not a tiger, because the latter is too difficult; only those with great ability can help it.

但慈悲心是可以培养的。我们要从缘起的立场，看待并理解人的一切差别。比如那些我们不喜欢的人，那些性格扭曲甚至道德败坏的人，他们之所以会这样，是来自长期的累积。事实上，他们自己就是不良心态和品行的最大受害者，然后才会波及他人。关于慈悲心的修行，要在理解、接纳的前提下不断训练。开始可能不太容易，需要说服自己去做。随着慈悲心的增长，就会主动承担。从另一方面来说，这么做也是在散播慈爱，总会有人受到感染，同样地回馈你，回馈他人，招感和谐友好的社会环境。大环境好了，互帮互助就是自然而然的，不必有多余的担心。那样的社会，需要大家共同努力。

But compassion can be cultivated. We must look at and understand all human differences from the standpoint of _dependent origination_. For example, those we dislike, those with twisted characters, even those with corrupt morality—they have become this way through long-term accumulation. In fact, they themselves are the greatest victims of their own negative mental states and conduct, and only afterward does the harm spread to others. The practice of compassion must be trained on the basis of understanding and acceptance. At first it may not be easy; you have to persuade yourself to act. As compassion grows, you will naturally take on responsibility. On another level, doing so also spreads kindness. Someone will be moved by it and respond with the same kindness to you and to others, creating a harmonious and friendly social environment. When the greater environment improves, mutual help becomes natural, without extra worry. Such a society requires everyone's joint effort.

=== 磨刀不误砍柴工 / Sharpening the Ax Does Not Delay the Cutting of Wood <ch11-q05>

_问：_ 我工作较忙，而且发愿组建义工团队，空闲时间很少。虽然我对三级修学的次第很感兴趣，但苦于没有固定时间修学，能不能自学？此外，我做的是面向社会的义工组织，以年轻人为主。大家比较忙，发心和爱好也不一样，怎么引导大家做好义工行？

_Q:_ I am rather busy with work and have also vowed to form a volunteer team, so I have little free time. Although I am very interested in the graduated stages of Three-Stage Practice, I have no fixed time for study. Can I study on my own? In addition, the volunteer organization I lead is oriented toward society and made up mostly of young people. Everyone is busy, and their motivations and interests differ. How can I guide everyone to do volunteer work well?

_答：_ 关于修学，第一，学总是比不学好；第二，有次第地学比随便学效果更好；第三，参加三级修学的氛围肯定比自学好。你可以根据自身条件来选择。其实忙不忙是相对的，你觉得什么更重要，就会有时间做什么。

_A:_ Regarding study, first, studying is always better than not studying; second, studying with a systematic progression is more effective than studying haphazardly; third, the atmosphere of participating in Three-Stage Practice is certainly better than self-study. You can choose according to your own conditions. Whether we are busy is relative. Whatever you consider more important, you will find time for.

关于义工团队，不论佛教界还是社会上的，只要做有益大众的事，意义都一样。关键是怎么做得有效，做得长久？有效体现在两方面，一是自己做得欢喜并得到提升，二是让参与者和受助者都能得到真正的帮助。长久也体现在两方面，一是目标明确，心行稳定，二是让做事成为修行，从而源源不断地提供动力。

Regarding volunteer teams, whether in the Buddhist community or in society, as long as you are doing something beneficial for the public, the meaning is the same. The key is how to do it effectively and sustainably. Effectiveness has two aspects: first, doing the work joyfully and growing through it yourself; second, ensuring that both participants and recipients receive genuine help. Sustainability also has two aspects: first, having clear goals and stable mindsets; second, making the work itself a form of practice, so that it provides a continuous source of motivation.

如何才能有效、长久地自利利他？取决于你所发的是不是纯粹的慈悲心，也取决于你是不是有智慧引导，能不能善巧处理问题。这就必须提升自己，当我们通过学佛增长慈悲和智慧，进而将此带入义工团队，引导大家调整发心，并在智慧指导下做事，义工行必然更有质量，更有意义。这本身就是对团队的滋养，可以增强凝聚力。很多义工团队做不下去，主要就是思想不统一，做事效果也差强人意，自然越做越没感觉。我们既然发心做有益社会的事，一定要注重自身素养，修学其实是磨刀不误砍柴工。

How can benefiting self and others be effective and sustainable? It depends on whether your motivation is pure compassion and whether you have the wisdom to guide and skillfully handle matters. This requires elevating yourself. When we grow in compassion and wisdom through Buddhist practice and bring this into the volunteer team, guiding everyone to adjust their motivation and act under the guidance of wisdom, volunteer work will inevitably be of higher quality and greater meaning. This itself nourishes the team and strengthens cohesion. Many volunteer teams cannot keep going mainly because their thinking is not unified and the results are barely satisfactory, so naturally they lose motivation over time. Since we have aspired to do something beneficial for society, we must value our own cultivation. Study is like sharpening the ax before cutting wood—it does not delay the work.

== 十二、工作即修行 / XII. Work Itself Is Practice <ch12>

=== 用缘起智慧和利他心做管理 / Managing with the Wisdom of Dependent Origination and an Altruistic Mind <ch12-q01>

_问：_ 如何将佛法引入企业文化？怎么把这种智慧用在管理中，而不是被管理所累？

_Q:_ How can we bring the Dharma into corporate culture? How can we apply this wisdom in management rather than being worn down by it?

_答：_ 现在不少企业是老板文化，老板有什么想法，就有什么样的"文化”。为什么要倡导企业文化？因为企业管的是人，人的问题在心，所以真正要管的是人心。如果没有文化，是无法凝聚人心的。如果把智慧文化带到企业中，通过阅览室、读书会等方式，让员工有机会接受熏陶，建立正确的价值观，培养向善之心，不仅有益于员工的自身成长，管理起来也会更轻松。

_A:_ Many companies today reflect their boss's culture—whatever the boss thinks becomes the _culture._ Why advocate corporate culture at all? Because a company manages people, and people's problems lie in the mind; what really needs managing is people's hearts. Without culture, you cannot bring hearts together. If we bring a culture of wisdom into the company—through reading rooms, study groups, and so on—employees have a chance to be influenced, establish correct values, and cultivate a mind inclined toward goodness. This not only benefits their personal growth but also makes management easier.

对于管理者来说，缘起法和利他心特别有帮助。如果了解到企业是众缘和合的，同时多一些无我利他之心，就不会以个人的感觉和利益为中心。那样的话，最后用力的只是少数人，不仅做起来非常辛苦，也会被成败得失所累。日本的稻盛和夫就是以佛法指导企业管理，让员工充分发挥自主性，成就了两家世界五百强企业。所以我们不要把企业作为"我执”的延伸，而要本着服务大众的心，建立一个开放的平台，把利益和责任尽量下放，让大家在这里共创共赢，就能做得更自在。

For managers, the Dharma of dependent origination and a mind of altruism are especially helpful. Understanding that a company arises from the coming together of many conditions, and adding a little more selfless altruism, keeps us from centering everything on our own feelings and interests. Otherwise, in the end only a few people are exerting effort; not only is this exhausting, but it also traps us in success and failure, gain and loss. Japan's Kazuo Inamori guided corporate management with the Dharma, allowing employees to take full initiative, and built two Fortune Global 500 companies. So we should not treat the company as an extension of _self-grasping,_ but with a heart that serves the public, establish an open platform, delegate benefit and responsibility as much as possible, and let everyone create and win together—then we can work with greater ease.

=== 正确发心，善用其心 / Arousing the Right Aspiration and Making Good Use of the Mind <ch12-q02>

_问：_ 如果说生命的意义在于自觉觉他，那我们现在的工作学习、成家立业、参与社会竞争，到底有没有终极意义？我觉得自己对重要感、优越感和主宰欲充满追求，但同时也为此烦恼。应该以什么心态对待人生追求？

_Q:_ If the meaning of life lies in awakening ourselves and awakening others, do our present work, studies, founding a family, building a career, and competing in society have any ultimate meaning at all? I feel full of desire for a sense of importance, superiority, and domination, yet I also suffer because of this. What attitude should I adopt toward life's pursuits?

_答：_ 从世俗的角度，凡有助于过好日子的所作所为都是有意义的，比如工作赚钱、成家立业。当然这只是相对的意义，并不究竟。对于这个问题，佛法有两种不同看法。从解脱道的角度，看不到世俗生活的意义。所谓追求，无非是以迷惑烦恼为基础，立足于贪嗔痴做种种事，以此满足贪嗔痴的需要。在这种惑业苦的轮回中，不论做什么都是无谓的。即使能改善外在条件，也不能改变其痛苦本质；即使能有所得，也是朝不保夕的。

_A:_ From a worldly perspective, anything that helps us live a good life has meaning—working to earn money, founding a family, and building a career, for example. Of course this is only relative meaning; it is not ultimate. On this question, the Dharma has two different views. From the perspective of the path of liberation, worldly life has no meaning. Pursuits take confusion and affliction as their basis, doing all sorts of things grounded in greed, hatred, and delusion to satisfy the needs of greed, hatred, and delusion. In this cycle of delusion, karma, and suffering, whatever we do is futile. Even if external conditions improve, it cannot change its painful nature; even if we gain something, it is precarious.

但从菩萨道的角度，并不否定世俗生活的价值，而是赋予其新的内涵。如果我们带着利他心和正念工作，不仅可以生存、养家，还可以造福社会。更重要的是，如果用心到位，工作也会成为修行的组成部分，以利他培福，以正念修心。禅宗就特别重视生活的修行，从穿衣吃饭到搬柴运水都是道用，而不仅仅局限于诵经、坐禅等特定形式。所以关键在于自身心行。一方面要正确发心，定位于自利利他，而不是为了满足自己的重要感、优越感和主宰欲；一方面要善用其心，时刻带着正念做事，同时通过做事来训练正念。做到这两点，在工作和生活中，不仅能成就现实价值，也能实现究竟意义。

But from the perspective of the bodhisattva path, the value of worldly life is not denied; rather, it is given new meaning. If we work with an altruistic mind and right mindfulness, we can not only support ourselves and our families but also benefit society. More importantly, if we apply our minds fully, work becomes part of spiritual practice: we cultivate merit through altruism and refine the mind through right mindfulness. The Chan school especially emphasizes practice in daily life, from dressing and eating to carrying firewood and drawing water—all are expressions of the Way, not limited to specific forms such as reciting sutras or sitting in meditation. So the key lies in our own mental activity. On the one hand, we must arouse the right aspiration, orienting ourselves toward benefiting ourselves and others, rather than satisfying our need for importance, superiority, and domination. On the other hand, we must make good use of the mind, doing everything with right mindfulness and using activity to train right mindfulness. If we accomplish these two points, in work and in life we can realize both worldly value and ultimate meaning.

=== 把修行带入工作和生活 / Bringing Practice into Work and Life <ch12-q03>

_问：_ 回到世俗生活后，要面对工作、家庭的种种责任，怎么让所做的这些成为修行？我们还是凡夫，心常常会随境而转，甚至被转的时候还不知不觉，怎么才能保持觉知？

_Q:_ After returning to worldly life, we have to face all kinds of responsibilities at work and at home. How can we make what we do into practice? We are still ordinary beings; our minds often follow circumstances and are turned by them, even without our knowing it. How can we maintain awareness?

_答：_ 入世的修行，首先要发菩提心，这是帮助我们确立人生的目标和方向。带着菩提心做事，和本着自我需要做事，虽然事情可能是一样的，结果却完全不同。从自我需要出发，成就的是世俗心；而带着菩提心做事，成就的是慈悲，同时可以弱化我执，增长智慧。其次是有佛法正见，这直接关系到我们能否让做事成为修行。如果没有正见，我们往往会顺着固有习惯，用错误观念和不良情绪待人处世，每件事都会成为烦恼的增上缘。反之，一切问题都能成为解脱的增上缘。

_A:_ For practice in the world, the first thing is to arouse bodhicitta, which helps us establish the goal and direction of life. Doing things with bodhicitta and doing things out of self-need may look the same, but the results are completely different. Starting from self-need develops a worldly mind; doing things with bodhicitta develops compassion, while at the same time weakening self-grasping and growing wisdom. The second requirement is having the right view of the Dharma, which directly determines whether our activity can become practice. Without right view, we usually follow habitual patterns, relating to people and situations with wrong ideas and negative emotions, and every matter becomes a condition that strengthens afflictions. Conversely, every problem can become a condition for liberation.

至于在面对境界时怎么保持觉知，先要学会方法。静修营安排的禅修体验，就是让大家了解相关原理后，把这种方法带入生活。但更重要的是反复训练，时时培养。其实方法并不难，难的是持续、稳定地保持专注，让这种觉知遍一切时一切处。我们内心有很多错误习惯，相对这些根深蒂固的惯性，刚刚培养的觉知力很弱小，必须抓紧一切机会练习，才能逐步纠正固有惯性，培养正确的心行习惯。

As for how to maintain awareness when facing circumstances, first learn the method. The meditation sessions arranged by the retreat are meant to let everyone understand the relevant principles and then bring this method into daily life. But more important is repeated training and constant cultivation. Actually the method is not difficult; what is difficult is sustaining steady focus and allowing this awareness to pervade all times and all places. Our minds contain many wrong habits; compared with these deep-rooted tendencies, the awareness we have just cultivated is very weak. We must seize every opportunity to practice, gradually correcting habitual patterns and cultivating wholesome mental habits.

=== 慈悲生祸害 / Compassion Breeds Misfortune <ch12-q04>

_问：_ 学佛后心态变得平和，但同事知道我在学佛，就有恃无恐地欺负。这使我起了嗔心，又用原来的方式处理问题，反倒很见效。我感到很困惑，这种情况该怎么办？

_Q:_ After learning Buddhism my mind has become more peaceful, but my colleagues know I practice and have become brazen about bullying me. This arouses anger in me, and when I handle the problem in my old way, it actually works. I feel quite confused—what should I do in this situation?

_答：_ 用世间方式处理问题，虽然现象暂时平息了，未必能从根本上解决问题。有时还会带来副作用，从自己来说，容易增长嗔心；从对方来说，则会引发对立，于人于己都没好处。如果已经学佛，就要用智慧来化解。佛法让我们心态平和，慈悲待人，但并不是软弱，更不是没有原则，否则可能会引发对方的不良习气，也是不对的。我们应该本着慈悲心，基于相关规则，心平气和地和大家沟通，必要时也可以适当惩罚。但这么做不是出于嗔心，而是帮助他更好地做事。有句话叫作"慈悲生祸害”，指的就是这种没有原则、缺乏善巧的"滥慈悲”，这其实是对不良习气的纵容。

_A:_ Handling problems in a worldly way may calm the surface temporarily, but it does not necessarily solve them fundamentally. Sometimes it also brings side effects: for ourselves, it easily increases anger; for the other person, it provokes opposition—no benefit to anyone. If we have already begun learning the Dharma, we should use wisdom to resolve it. The Dharma brings peace of mind and teaches us to treat others with compassion, but this is not weakness, much less lack of principle; otherwise it may encourage the other person's unwholesome habits, which is also wrong. We should communicate with everyone calmly, based on compassion and the relevant rules, and when necessary we may also impose appropriate penalties. But this is not done out of anger; it is to help the person do better. There is a saying, _Compassion breeds misfortune,_ which refers to this kind of unprincipled, unskillful _indiscriminate compassion_—in fact, it indulges unwholesome habits.

=== 职业不如法怎么办 / What to Do When One's Occupation Is Not in Accord with the Dharma <ch12-q05>

_问：_ 我们是以捕鱼为生的，平时会到各地寺院做佛事，通过打水陆、普佛、诵经来消业，这么做如法吗？

_Q:_ We make our living by fishing and usually go to various temples to perform Buddhist rites, purifying karma through water-and-land ceremonies, universal Buddha offerings, and sutra recitation. Is this in accord with the Dharma?

_答：_ 职业和信仰的冲突，是个现实问题。尤其在特定地区，某些职业是祖祖辈辈的传统，选择相对较少。学佛后了解到这么做的果报，究竟该怎么办？取决于你的认识和信仰深度。如果真正认识到，自己为了生存和利益造下很多杀业，让众生失去生命，自己将来也要承受苦果，实在得不偿失，就应该重新选择正命的职业。就像看到工作严重危害身体健康时，你还会继续吗？人们之所以对某些犯戒的工作放不下，主要还是对其中的危害认识不足，心存侥幸。事实上，因果是丝毫不爽的。

_A:_ The conflict between occupation and faith is a practical issue. Especially in certain regions, some occupations are ancestral traditions, and the choices are relatively few. After learning Buddhism and understanding the karmic consequences of doing this, what should you do? It depends on the depth of your understanding and faith. If you truly realize that in order to survive and profit you are creating much killing karma, causing sentient beings to lose their lives, and that you yourself will have to suffer the bitter results in the future, then the loss outweighs the gain and you should choose a right livelihood. Just as when you see that a job seriously harms your health, would you continue? The reason people cannot let go of certain precept-violating work is mainly insufficient understanding of the harm involved, plus wishful thinking. In fact, cause and effect never miss.

当然在难以改变职业的情况下，通过做佛事来弥补，总比不弥补要好。但如果有条件转行，还是应该选择符合法律和戒律的职业。因为职业是天天做的，一做几十年，不善业就这么日积月累，不断增长。

Of course, when it is hard to change occupations, making up for it through Buddhist rites is better than doing nothing. But if conditions allow a change, one should still choose an occupation that conforms to the law and the precepts. Because an occupation is done every day, year after year for decades; unwholesome karma accumulates day by day and keeps growing.

== 十三、生死和无常 / XIII. Death and Impermanence <ch13>

=== 长寿和安乐死 / Longevity and Euthanasia <ch13-q01>

_问：_ 我是研究生命科学的，经常去肿瘤医院，看到很多病人遭受疾病折磨。现在不少科学家研究长寿饮食，希望找到让人活得更久的方法。事实上，虽然科技使人均寿命达到70多岁，但真正健康的年龄只有50多岁，此后的生活质量并不高。这种让人活得更久的科学研究有意义吗？此外，佛教怎么看待安乐死？如果有人得了无法医治的重病，活得痛苦不堪，只是耗财耗力，选择安乐死算自杀或杀生吗？

_Q:_ I work in the life sciences and often visit cancer hospitals, where I see many patients tormented by illness. Nowadays many scientists study longevity diets, hoping to find ways to extend human life. In fact, although technology has raised average life expectancy to over seventy, the span of truly healthy years is only about fifty, and quality of life after that is not high. Does research aimed at extending life have any meaning? Also, how does Buddhism view euthanasia? If someone has an incurable disease, suffers unbearably, and only drains money and energy, is choosing euthanasia considered suicide or killing?

_答：_ 活到70岁还是100岁，甚至1000岁、10000岁，终究要面对生死，不过是早晚的问题。那么，活长一点的意义在哪里？关键在于我们怎么使用生命。如果为了活着而活着，甚至痛苦地、没有意义地活着，其实长点还是短点，从本质上说差别不大。当然每个生命都有生存的希求，从自身和家人的感觉来说是不一样的。佛教认为人身难得，在于用它来止恶修善，自利利他。如果能用好这期生命，寿命长一点，就意味着我们有更多的修行时间，可以更好地利益众生。从这个角度说，寿命长短对自身和对社会的意义确实不一样。

_A:_ Whether we live to seventy or a hundred, or even a thousand or ten thousand years, we must eventually face birth and death; it is only a matter of sooner or later. So what is the meaning of living longer? The key lies in how we use our life. If we live merely for the sake of living, or even live painfully and meaninglessly, then in essence there is little difference between a longer or shorter life. Of course every being has the desire to survive, and for oneself and one's family the feeling is different. Buddhism holds that the human body is hard to obtain, and its value lies in using it to stop evil and cultivate good, to benefit oneself and benefit others. If we can make good use of this present life, a longer lifespan means more time for practice and more ability to benefit sentient beings. From this angle, the length of life does have different meaning for oneself and for society.

关于安乐死，从声闻戒的角度，不论在什么情况下都不能杀别人，也不能自杀。但作为菩萨行者，如果看到有人非常痛苦，恳请菩萨帮助他结束生命，菩萨为了避免他承受这么重的痛苦，愿意自己承担杀生的果报来成全他，从菩萨戒的角度来说不算犯戒。

From the shravaka-precept perspective, under no circumstances may we kill another or ourselves. But as a bodhisattva practitioner, if one sees someone in extreme pain earnestly asking to be helped to end his life, and the bodhisattva, wishing to spare him such heavy suffering, is willing to bear the karmic retribution of killing in order to grant his wish, then from the bodhisattva-precept perspective this is not a precept violation.

=== 怎么才能对去向有把握 / Being Confident about Where One Is Going <ch13-q02>

_问：_ 我身体不好，很担心哪天就会死，怎样修行才能使身体健康？才能对今生去向较有把握？

_Q:_ My health is poor, and I worry that I might die any day. How should I practice to make the body healthy? And how can I be more confident about where I will go in this life?

_答：_ 身体健康是多方面的。首先是保持良好心态，放下不必要的心理包袱；其次是合理安排饮食，不要为口腹之欲造作杀业；第三是多做户外运动。从佛法来说，还提倡多放生，以慈悲心关爱动物。你让众生免遭横死，活得安乐，自然会感得健康的果报。此外，适当的禅修也有助于身体健康。

_A:_ Physical health depends on many factors. First, maintain a good state of mind and set down unnecessary psychological burdens. Second, arrange your diet properly and do not create killing karma for the pleasure of the palate. Third, get plenty of outdoor exercise. From the Dharma perspective, we also encourage releasing living beings and caring for animals with compassion. When you spare beings from untimely death and help them live in peace, you will naturally reap the karmic result of health. In addition, proper meditative practice also benefits physical health.

至于担心死的问题，其实念死本身就是修行增上缘。当我们想到生命危脆，朝不保夕，对世间的贪著就会减少，可以更快进入修行状态。在不明心性之前，我们会对生死感到迷茫，正是因为认识到这一点，才更要努力修行。通过念死无常、念轮回苦，对三宝生起坚定的信心。只要我们深信三宝为世间唯一依靠，念兹在兹，无论何时离开世界，都不必担心堕落恶道。

As for worrying about death, contemplating death itself is a supportive condition for progress in practice. When we reflect that life is fragile and that we may not last until evening, our attachment to the world decreases and we can enter the practice state more quickly. Before we clearly understand the mind-nature, we feel confused about birth and death; precisely because we recognize this, we must strive all the harder in practice. Through contemplating death and impermanence and contemplating the suffering of samsara, we give rise to firm faith in the Three Jewels. As long as we deeply believe that the Three Jewels are the only refuge in the world and keep them constantly in mind, whenever we leave this world we need not fear falling into the evil realms.

=== 化悲痛为力量 / Turning Grief into Strength <ch13-q03>

_问：_ 父亲在两年前午睡时突然过世了，母亲常常泪流满面地说：善有善报，为什么善良的父亲这么年轻就一声不吭地走了？我也一直活在强烈的自责中，觉得自己没有完成父亲的心愿，也没能照顾好他。如何排解母亲和我的痛苦？

_Q:_ My father passed away suddenly during an afternoon nap two years ago. My mother often says through tears, "Good is rewarded with good; why did such a kind father leave so silently at such a young age?" I too have lived in intense self-blame, feeling that I did not fulfill my father's wishes and did not take good care of him. How can my mother and I release this pain?

_答：_ 人人都希望家庭美满、父母长寿、儿女孝顺，但世间的因果非常复杂，包括今生和往昔的业力。这就使得生命充满无常变化，不是我们希望怎样就能怎样的。事实上，死亡是每个人都要面临的。佛世时，有个孩子夭折了，他母亲非常难过，抱着尸体到处求人，希望把孩子救活。经人指点到了佛陀那里，佛陀对她说：只要你找到一户从没死过人的家庭，问他们要一点芥子，我就能把孩子救活。这位母亲以为终于有救了，结果问来问去，发现所有家庭都曾死过人。最终，她在佛陀开示下认识并接纳了无常。

_A:_ Everyone hopes for a happy family, long-lived parents, and filial children, but worldly cause and effect are extremely complex, including karma from this life and from past lives. This makes life full of impermanent change; it does not unfold just as we wish. Death is something every person must face. In the time of the Buddha, a child died young. His mother was heartbroken and carried the body everywhere, begging people to bring the child back to life. Guided by others, she came to the Buddha. The Buddha told her, "As long as you find a household where no one has ever died and ask them for a little mustard seed, I can bring the child back to life." The mother thought there was finally hope, but after asking everywhere she found that every family had experienced death. Finally, under the Buddha's teaching, she recognized and accepted impermanence.

有人觉得学佛是保平安，使一切顺利。其实从修行角度说，顺境不一定比逆境更好。因为顺境容易让人心生贪著，逆境反而能让人看到世间真相。学佛的关键是给我们智慧，让我们有能力接纳各种问题，得意时有平常心，失意时还能有平常心。而不是像原来期待的那样，一切都能天长地久，那只是幻想而已。不仅父母会离开世界，我们也会离开世界。不用一百年，在座所有人统统不在了。认清无常的道理，在接纳家庭变故的同时，才知道自己该做些什么。悲痛可以理解，但只有化悲痛为力量，珍惜人身，抓紧今生的时间修行，才对自己和亡者都有利益，才能真正告慰亡者。

Some people think that learning Buddhism ensures safety and smooth sailing. From the perspective of practice, favorable circumstances are not necessarily better than adverse ones. Favorable circumstances easily give rise to attachment, while adverse circumstances can help us see the truth of the world. The key to learning Buddhism is to give us wisdom so that we can accept all kinds of problems, keeping an ordinary mind whether things go well or badly. It is not, as we used to expect, that everything can last forever; that is only an illusion. Not only will our parents leave the world, but we too will leave the world. In less than a hundred years, everyone here will be gone. When we clearly understand the principle of impermanence, while accepting family changes, we will know what we ourselves should do. Grief is understandable, but only by turning grief into strength, treasuring the human body, and seizing the time in this life to practice can we benefit both ourselves and the deceased, and truly comfort the departed.

=== 无常让我们更珍惜 / Impermanence Calls Us to Treasure This Life <ch13-q04>

_问：_ 我们家一直与人为善，能帮忙时一定帮，但这两年中，父亲、奶奶、爷爷相继去世了。为什么他们走得那么快？我一直比较困惑，也没走出来，应该怎么看待这些？

_Q:_ Our family has always been kind to others; whenever we can help, we do. Yet in the past two years my father, grandmother, and grandfather passed away one after another. Why did they leave so quickly? I have been quite puzzled and unable to move on. How should I view this?

_答：_ 每个生命都有他的因果，我们在无尽轮回中走到一起，也是有缘分的。但缘起甚深，今生的寿限和缘分长短，很多是往昔业力决定的。也就是说，与人为善虽然是造善业，但未必马上看到结果，也未必今生就能长寿。我们希望家人团圆，天长地久，这是人之常情，但业果并不随着我们的期待而转移。

_A:_ Every life has its own karma. We have come together through endless samsara because we have affinities. But dependent origination is profound; the length of this life's lifespan and the duration of our affinities are largely determined by past karma. That is to say, although being kind to others creates good karma, the results may not be seen immediately, nor does it necessarily mean long life in this present life. We hope for family reunion and relationships that last forever—this is natural human feeling. But karmic results do not shift according to our expectations.

学佛是帮助我们建立无常的认识，从而接纳一切变化，包括自己和身边的人。他们会离去，我们也会离去，乃至地球也终有一天要毁灭。在这个世间，唯一有意义的是提升生命品质，最终走向觉醒。我们现在得到人身，可以闻法修行，是极其难得的机会，也是多生累劫善业招感的，每一天都非常珍贵。如果不珍惜，不用来精进修行，转瞬就是来世，我们还有把握得人身、闻正法吗？无常时刻在发生，死亡则是这期生命的唯一终点，这都在提醒我们珍惜人身，用好这个难得易失的机会，使未来生命生生增上。

Learning Buddhism helps us establish an understanding of impermanence, thereby accepting all changes, including those affecting ourselves and the people around us. They will depart, and we too will depart; even the earth will one day be destroyed. In this world, the only meaningful thing is to elevate the quality of life and ultimately move toward awakening. That we now have the human body and can hear the Dharma and practice is an extremely rare opportunity, the ripening of good karma accumulated over many lives and eons; every day is very precious. If we do not treasure it and use it to practice diligently, the next life will come in the blink of an eye. Can we still be sure of obtaining the human body and hearing the true Dharma? Impermanence is happening every moment; death is the only end of this present life. All of this reminds us to treasure the human body, make good use of this rare and easily lost opportunity, and cause future lives to ascend life after life.

=== 算命不如做好当下 / Doing the Present Well Is Better Than Fortune-Telling <ch13-q05>

_问：_ 民间流行算命之类，法师曾说，这种事虽不能全信，但也不完全是迷信，究竟应该怎么看待？尤其是遇到逆境时，很想知道什么时候可以转运。

_Q:_ Folk practices like fortune-telling are popular. The teacher once said that although such things should not be fully believed, neither are they entirely superstition. How should we actually regard them? Especially when encountering adverse circumstances, we really want to know when our luck will turn.

_答：_ 佛法以因缘因果说明万物的发展规律，包括产生、存在和消失。既然有规律，就是可预测的。从这个角度说，算命并非子虚乌有，也有它的道理，关键在于算得准不准。这就涉及两个问题，一是采用的方法是否有效，就像探测矿藏，仪器的灵敏度和准确性非常重要；二是使用者的技术是否过关，如果学艺不精，就容易误判。

_A:_ The Dharma explains the laws of development of all things through dependent origination and cause and effect, including arising, abiding, and ceasing. Since there are laws, they are predictable. From this perspective, fortune-telling is not groundless; it has its reasoning. The key is whether it is accurate. This involves two issues: first, whether the method used is effective—just like prospecting for minerals, the sensitivity and accuracy of the instrument are crucial; second, whether the practitioner's skill is adequate—if one's learning is not refined, it is easy to misjudge.

佛法不主张算命，而是让我们"因上努力，果上随缘”。命运是一种结果，是自身业力招感的，既然是自己造成的，就应该坦然接纳。至于什么时候转运，并不是靠算出来的，而是取决于你有没有转化的智慧。如果能以智慧看待，逆境正可以让人警醒，策励精进，是生命成长不可或缺的增上缘，当下就能转运。

Buddhism does not advocate fortune-telling. Instead, it teaches us to "work hard on the causes and let the results unfold as they may." Destiny is a result, attracted by our own karma. Since it is self-created, we should accept it calmly. As for when luck will turn, it is not calculated by divination but depends on whether you have the wisdom to transform it. If you can view it with wisdom, adverse circumstances can serve as a warning, spur diligence, and become an indispensable supportive condition for life's growth; then your luck has already turned in this very moment.

从另一方面来说，我们想要有美好的未来，就要了解每种乐果的因是什么，比如身体健康的因是什么，人格健全的因是什么，人际关系和谐的因是什么，然后从因上努力。生命是无尽的累积，无穷的过去以现在为归宿，无尽的未来以现在为开端。我们现在想什么，做什么，决定了未来会成为什么，所以关键是把握当下。做好当下该做的，未来自然是好的。

On the other hand, if we want a good future, we must understand what causes produce what happy results—for example, what causes physical health, what causes sound character, what causes harmonious interpersonal relationships—and then work hard on those causes. Life is an endless accumulation. The boundless past comes to rest in the present; the infinite future begins with the present. What we think and do now determines what we will become in the future. Therefore, the key is to grasp the present. Do well what should be done now, and the future will naturally be good.

== 十四、弘法利生 / XIV. Propagating the Dharma and Benefiting Sentient Beings <ch14>

=== 对传统的反思 / Reflecting on Tradition <ch14-q01>

_问：_ 法师曾写过《汉传佛教的反思》，您为什么想到要反思传统？

_Q:_ You once wrote "Reflections on Chinese Buddhism." What led you to reflect on tradition?

_答：_ 传统有着巨大的力量，尤其是宗教传统，力量更为强大。但在今天这个资讯发达的时代，我们除了看到汉传佛教的传统外，还能看到印度佛教早期、中期、晚期的传统，看到南传和藏传佛教的传统。当我们有了广阔的视野，会发现传统并不是唯一的，而且以往传承的并不全是优良传统，也夹杂着陈规陋习。

_A:_ Tradition carries immense power, and religious tradition is especially potent. But in today's information-rich age, besides the traditions of Chinese Buddhism, we can also see the traditions of early, middle, and late Indian Buddhism, as well as Theravada and Tibetan Buddhism. Once we broaden our vision, we realize that there is no single tradition, and not everything handed down is excellent; it also contains outdated conventions and harmful practices.

佛法弘扬强调契理契机。契理是立足于佛法根本精神来弘扬，否则就会像印顺法师所说的那样：有人卖牛奶时加了一点水，买主再加点水卖给别人，对方再加点水卖给下一位，如此辗转，牛奶就渐渐稀释为水了。佛法在向外传播的过程中，会不断介入当地的文化、习俗、社会等因素，逐渐变得面目模糊。这就需要正本清源，知道哪些是佛法的真正核心。同时还要契机，用现在的话说，就是要现代化，要与时俱进。事实上，佛法在任何时代的弘扬都经历了当时的现代化，南北朝有南北朝的现代化，唐朝有唐朝的现代化。如果没有这项转化工作，人们接受佛法时就会产生隔阂。我们今天不仅要从源头继承佛法，也要根据时代的特点，建立契合当代的佛法修学体系。这是我反思传统的初衷，这种反思不是为了批判，而是为了更好地传承和弘扬。

Spreading the Dharma must always be _accordant with principle and adapted to the times_. To accord with principle means to stand upon the fundamental spirit of the Dharma; otherwise, as Master Yinshun observed, it is like selling milk diluted with water: the buyer adds more water before selling it on, and the next person does the same, until the milk has gradually become nothing but water. As the Dharma spreads outward, it continually absorbs local culture, customs, and social factors, gradually becoming unrecognizable. Therefore we must return to the source and clarify what is truly central to the Dharma. At the same time, we must adapt to the times; in modern terms, this means modernization and keeping pace with the times. In fact, every age has had to present the Dharma in its own terms; the Northern and Southern Dynasties did, and so did the Tang. Without this transformative work, people will feel alienated when they encounter the Dharma. Today we must inherit the Dharma from its source and also build a Dharma study system suited to the contemporary age, according to the characteristics of our times. This is my original intention in reflecting on tradition; such reflection is not for the sake of criticism, but for better preservation and propagation.

=== 用智慧让世界变得更好 / Making the World Better with Wisdom <ch14-q02>

_问：_ 我学电视编导专业，很关心文化传播，感觉世人对佛教存在很多偏见，这种偏见始于何时？当前弘法的阻力是什么？如果佛法得到传播，世界会变得更好吗？

_Q:_ I major in television production and am very interested in cultural communication. I feel that many people hold prejudices against Buddhism. When did these prejudices begin? What are the current obstacles to propagating the Dharma? And if the Dharma were widely spread, would the world become a better place?

_答：_ 佛法传入中国2000多年来，早已成为传统文化的重要部分，但始终伴随各种偏见。其中既有文化的差异，也有佛教自身的问题。比如认为佛教悲观、消极、出世，是因为汉传佛教没能积极彰显大乘精神，落实菩提心教法；认为佛教宣扬迷信，是因为教界弘法力度不足，以及各种文艺作品的误导。除了既有问题，当代佛教经历十年浩劫的摧残，又在商业浪潮中迅速发展，难免鱼龙混杂，乱象丛生。这些都阻碍了佛法的有效传播。

_A:_ Since the Dharma came to China more than two thousand years ago, it has long been an important part of traditional culture, yet it has always been accompanied by various prejudices. Some of these arise from cultural differences, and some from problems within Buddhism itself. For example, people see Buddhism as pessimistic, negative, and world-renouncing because Chinese Buddhism has failed to bring out the Mahayana spirit and put bodhicitta into practice. The view that Buddhism promotes superstition arises from insufficient Dharma propagation within the Buddhist community and from misleading portrayals in literature and art. Beyond these existing problems, contemporary Buddhism was devastated by the decade-long catastrophe and then grew rapidly amid commercialization. So the authentic and the inauthentic are mixed together, and confusion abounds. All of these hinder the effective spread of the Dharma.

虽然问题很多，但目前的传播平台也是前所未有的。在这个角度看，现在又是最好的时代。而从社会需求来说，科技日益发达，人却越来越找不到自己。当使用者存在问题，那么工具越先进，潜在危险就会越多。事实上，人类正处在这样的危机中。如果说科技是改造世界的工具，那么佛法的作用恰恰在于优化工具使用者。只有提升全人类的道德感和责任心，才能保障世界和平。

Although there are many problems, we have unprecedented platforms for spreading the Dharma today. From this perspective, the present is the best of times. As for social need, although technology grows more advanced by the day, people increasingly lose themselves. When users have problems, the more advanced the tool, the greater the potential danger. In fact, humanity is facing just such a crisis. If technology is the tool for transforming the world, then the role of the Dharma is precisely to improve the user of the tool. Only by raising humanity's moral awareness and sense of responsibility can we safeguard world peace.

佛法能引导我们认识自己，造就健康的心态和人格。当这样的智慧得到传播，世界一定会变得更好。我们要看到佛法的普世价值，用好互联网等平台，在自我成长的同时造福社会。只有让更多的人点亮心灯，世界才有光明和希望。

The Dharma guides us to know ourselves and to develop a healthy mind and character. When we spread such wisdom, the world will certainly become better. We must recognize the universal value of the Dharma, make good use of the internet and other platforms, and benefit society while we grow ourselves. Only when more people light the lamp within will the world have light and hope.

=== 让佛法落地生根 / Helping the Dharma Take Root <ch14-q03>

_问：_ 我们当地的佛教徒很多，但以迷信为主，没有形成修学风气。如何才能尽一份力，引导他们走上修学之路？

_Q:_ There are many Buddhists in our area, but their practice is mostly superstitious, and there is no real culture of study and practice. How can we do our part to guide them onto the path of study and practice?

_答：_ 佛教徒中确实存在很多迷信现象，尤其在农村和相对边远的地区，这种情况更为普遍。佛法传入以来，在隋唐达至鼎盛，其后逐渐走向衰落，并出现鬼神化、来世化、神秘化等陈规陋习。佛法是广博高深的智慧文化，但从不少信众的素质来看，似乎没什么文化，或是不需要文化。这种反差让人感慨，也说明了弘法和教育的重要性。

_A:_ There is indeed a great deal of superstition among Buddhists, especially in rural and relatively remote areas, where the situation is even more common. Since the Dharma was transmitted to China, it reached its height during the Sui and Tang dynasties and then gradually declined, giving rise to such bad habits as ghost-and-spirit worship, fixation on the afterlife, and mystification. The Dharma is a broad and profound wisdom-culture, yet judging from the level of many believers, it seems they have little culture or even need none. This contrast is saddening and also shows the importance of Dharma propagation and education.

佛法在弘扬过程中出现两个阶层，一是精英阶层，如高僧大德和文人士大夫；一是民俗阶层，如求求拜拜的广大信众，仅仅把信佛当作保平安、得加持的途径。走精英路线，佛法就会曲高和寡，难以接引普罗大众；走民俗路线，又会偏离修行根本，无法使这一智慧真正发挥作用。

As the Dharma has spread, two groups have emerged. One is the elite group, such as eminent masters and scholar-officials; the other is the folk group, such as the broad mass of believers who merely pray and bow, taking faith in Buddhism only as a means to seek safety and blessings. If we take the elite route, the Dharma becomes too lofty and esoteric to reach ordinary people; if we take the folk route, we stray from the root of cultivation, and this wisdom cannot truly serve its purpose.

我们弘扬人生佛教，就是要打破两者的界限，让高深的佛法回归生活，为现实人生服务。佛法虽然博大，但修行重点就是我们的心。立足于这一角度，会发现佛法和人生息息相关，并不是现实之外的、形而上的抽象理论。大家通过静修营这几天的讲座，多少能感受到佛法对人生的价值，对社会的意义。但要使之发挥更大作用，还需要大家共同推动。今天的社会可能比任何时代都需要佛法，因为现代人有更多的烦恼和压力，活得更累。希望大家都能发菩提心，通过修学受益后，把智慧文化传播出去，这不论对个人还是世界都意义重大。

In propagating Humanistic Buddhism, we seek to break down the boundary between these two, allowing the profound Dharma to return to daily life and serve real human existence. Although the Dharma is vast, the focus of practice is our own mind. From this standpoint, we see that the Dharma is closely bound up with life; it is not some abstract metaphysical theory separate from reality. Through the talks of these past few days at the Bodhi Retreat, you have more or less felt the value of the Dharma for life and its significance for society. But for it to have greater effect still requires our joint effort. Today's society may need the Dharma more than any previous age, because modern people have more afflictions and stress and feel more worn out. I hope everyone will arouse bodhicitta, benefit from study and practice, and then spread this wisdom-culture; this is of great significance both for the individual and for the world.

=== 以利他心而不是功利心传灯 / Passing On the Dharma Light with an Altruistic Heart, Not a Calculating Mind <ch14-q04>

_问：_ 学佛后，感到佛法对自己帮助很大，法喜充满，很想分享给身边的朋友，以此帮助他们。但因为工作原因，不方便直白地表达，在这种情况下，怎么做好传灯？

_Q:_ Since I began studying Buddhism, I have felt that the Dharma has helped me a great deal and I am filled with Dharma joy. I very much want to share it with friends around me and help them in this way. But because of my work, I can't be open about it. In such a situation, how can I pass on the lamp well?

_答：_ 我们从佛法受益了，希望帮更多人受益，是很好的发心。但怎么和他人分享，确实要找到恰当的方式。开始接引时，可以去宗教化，从人生智慧入手。现在不少人在转发我们发布于微博、微信的禅语，就是最简单的方式。如果对方有兴趣，可以给他们结缘人生佛教小丛书，逐步引导。此外，当亲友、同事有烦恼时，直接从运用层面切入，以佛法智慧引导他们转变观念，为他们排忧解难，往往会收到较好的效果。就像人在生病时，会对治疗有迫切希求，愿意认真服药。而当他感觉不到自己存在问题时，即使听着觉得有道理，也可能只是听听而已。

_A:_ It's a fine aspiration to want to help more people benefit after you yourself have benefited from the Dharma. But how to share it with others really requires finding an appropriate way. When first guiding people, we can set aside the religious form and start from the perspective of life wisdom. Nowadays many people forward the Zen phrases we publish on Weibo and WeChat; this is the simplest method. If the other person is interested, you can offer them booklets on Humanistic Buddhism and guide them gradually. In addition, when relatives, friends, or colleagues are troubled, you can start directly from the practical level, using the wisdom of the Dharma to help them shift their perspective and resolve their difficulties, which often produces good results. It is like when a person is ill: they urgently desire treatment and are willing to take the medicine seriously. But when they do not feel that they have a problem, even if what they hear makes sense, they may simply listen and let it pass.

需要注意的是，做的过程中要带着纯粹的利他心，而不是功利心，不要想着马上让对方认可佛法，加入修学，更不能带着把对方搞定的心理。我们点灯传灯，目的是帮助他人，但前提是他有这个需要。至于他能不能接受，进而于法受益，关键取决于他的意乐。我们只是作为一个助缘，起到引导的作用。所以，尽力做好自己能做的就行。

We should do this with a pure altruistic heart, not a calculating mind. Do not think of immediately getting the other person to accept the Dharma and join in study and practice, and certainly do not approach it with the attitude of winning them over. When we light a lamp and pass on the light, the purpose is to help others, but the precondition is that they have this need. Whether they can accept it and then benefit from the Dharma depends crucially on their own disposition and inclination. We are merely a supportive condition, playing a guiding role. So just do what you can do.

=== 以关心打动人心 / Touching Hearts Through Caring <ch14-q05>

_问：_ 我学佛四五年了，希望让朋友们受益，但他们不信因果，也不信轮回，觉得死后去哪里都无所谓，反正也不知道。对于这样的情况，应该怎么引导？

_Q:_ I have been studying Buddhism for four or five years and hope my friends can benefit, but they do not believe in cause and effect or in rebirth, and feel that where we go after death does not matter anyway, since no one knows. In such a case, how should I guide them?

_答：_ 首先随喜你有一份利他的心。不过每个人的根机和教育背景不同，我们认为好的东西，对方未必愿意接受。所以不要带着让人接受的心去说，而要本着理解和关心，针对他们现有的问题，提供佛法的解决之道。很多人虽然不信因果和轮回，但人生也有烦恼，也希望活得更幸福。可以基于这个前提，分享自己怎么解决烦恼，调整心态。通过自己的为人处世，让他们看到学佛人是有智慧、有慈悲、值得信赖的。这种真实转变最能打动人心，教化作用往往比说点什么更直接。对方有兴趣了，再给他送一些人生佛教的书。

_A:_ First, I rejoice that you have an altruistic heart. However, each person's capacity and educational background are different; what we consider good may not be what the other person is willing to accept. Therefore do not speak with the aim of getting them to accept; rather, proceed from understanding and caring, and offer the Dharma's solutions to the problems they actually have. Although many people do not believe in karma and rebirth, they still have afflictions in life and still wish to live more happily. Starting from this premise, you can share how you yourself resolve afflictions and adjust your state of mind. Through your own conduct and way of dealing with the world, let them see that a Buddhist practitioner is wise, compassionate, and trustworthy. Such genuine transformation is the most touching and often has a more direct transformative effect than anything you might say. When the other person becomes interested, then give them some books on Humanistic Buddhism.

当你的立足点不一样了，对方是能感受到的。很多人成年后思维固化，难以接受和原有认识不同的思想，但愿意接受他人的关心，所以切入的角度很重要。当然，我们并不是为了分享佛法才去关心别人，那就本末倒置了。而是为了更好地利他，才和对方分享佛法。其中的关键在于"真”，一是自己有真实转变，二是真心关爱他人。

When your standpoint is different, the other person can sense it. Many adults have fixed patterns of thought and find it hard to accept ideas different from what they already believe. Yet they are willing to accept others' care, so the angle of approach is very important. Of course, we do not care about others merely in order to share the Dharma; that would put the cart before the horse. Rather, we share the Dharma with them in order to better benefit them. The key lies in "authenticity": first, you yourself have undergone genuine transformation; second, you truly care for others.

=== 佛法能解决社会问题吗 / Can the Dharma Solve Social Problems? <ch14-q06>

_问：_ 佛教注重改善自心而觉醒，这是深奥且高尚的话题。但社会底层的人还在为缺乏基本的物质和尊重而痛苦，佛法怎么看待种族歧视和贫富差距等问题？有没有解决之道？

_Q:_ Buddhism emphasizes awakening through transforming one's own mind, which is a profound and lofty topic. Yet people at the bottom of society still suffer from lack of basic material goods and respect. How does the Dharma view problems such as racial discrimination and the gap between rich and poor? Is there a solution?

_答：_ 消除歧视，是佛教始终倡导的。印度传统宗教为婆罗门教，依种姓把人分为四等：第一是负责祭祀的婆罗门，第二是管理行政的刹帝利，第三是从事商业的吠舍，第四是作为贱民的首陀罗。这种差别流传至今。而佛教在当时是作为反婆罗门教的沙门集团出现的，提倡四姓平等，乃至众生平等，正是为了消除这种不平等现象。婆罗门教是神本的，认为吠陀天启，祭祀万能，一切都以神为中心。但佛教提出业力思想，认为人的贵贱不是因为出生、种族、血统，也不是因为职业和地位，而是取决于自身行为。你的行为高尚，就是高尚的；你的行为低贱，就是低贱的。

_A:_ Buddhism has always advocated eliminating discrimination. The traditional religion of India was Brahmanism, which divided people into four castes: first, the Brahmins, who performed sacrifices; second, the Kshatriyas, who administered government; third, the Vaishyas, who engaged in commerce; and fourth, the Shudras, who were treated as untouchables. This distinction persists to this day. Buddhism at that time appeared as an ascetic group opposed to Brahmanism, advocating equality among the four castes and even among all living beings, precisely in order to eliminate such inequality. Brahmanism was theocentric, holding that the Vedas were divinely revealed, sacrifice was all-powerful, and everything centered on the gods. But Buddhism put forward the idea of karma, holding that a person's nobility or baseness does not come from birth, race, bloodline, occupation, or status, but from one's own actions. If your conduct is noble, you are noble; if your conduct is base, you are base.

业力思想贯穿三世，由过去的言行和想法构成今天的存在，又由现在的所作所为决定未来。所以佛教认为命运是由自己造成的，我们想要美好的人生，就要多种善因，广结善缘。这是解决种族歧视和贫富差距的根本。如果没有这样的认识基础，社会问题是无法根治的。这种歧视解决了，新的歧视又会出现。就像现在流行的鄙视链，遍及生活的方方面面。

The teaching of karma runs through the three periods of time: the words, deeds, and thoughts of the past shape our present existence, and what we do now determines our future. Therefore Buddhism holds that we create our own destiny. If we want a beautiful life, we must plant more wholesome causes and form more wholesome connections. This is the root solution to racial discrimination and the gap between rich and poor. Without such a foundation of understanding, social problems cannot be fundamentally cured; when one kind of discrimination is solved, a new one will appear. Just think of the current prevalence of "contempt chains" extending into every corner of life.

而在现实问题上，佛教倡导无缘大慈、同体大悲的品质，作为大乘佛子，应该以解决众生痛苦为己任，通过利他努力实践，包括物质慈善和心灵慈善。前者和其他宗教、世间慈善是一样的，后者才是佛法的不共所在。

As for concrete problems, Buddhism advocates the qualities of unconditional great compassion and the great sympathy of seeing others as oneself. As disciples of the Mahayana, we should take relieving the suffering of sentient beings as our responsibility and put this into practice through altruistic effort, including material charity and spiritual charity. The former is the same as that offered by other religions and worldly philanthropy; the latter is what is unique to the Dharma.

=== 努力做就是了 / Just Keep Doing Your Best <ch14-q07>

_问：_ 法师说过，因为始终有一份弘法的愿心，才会不断感召善缘。那有没有某个时刻做事很困难，有做不动的感觉？

_Q:_ You have said that because you always hold the aspiration to propagate the Dharma, you continually attract wholesome conditions. Have there been moments when things were very difficult and you felt unable to keep going?

_答：_ 可能因为我对结果不太执著，所以在做事过程中，一直没觉得有特别大的违缘，也没觉得特别困难。从佛法角度看，任何事的成败都要遵循因缘因果。不论个人修行还是弘法利生，能做的就是建立正确因缘，同时也接纳一切结果。修行本来就不容易，而要帮助大众从迷惑走向觉醒，涉及众多因缘，就更不容易，即使做不好也是正常的。

_A:_ Perhaps because I am not too attached to results, in the course of my work I have never felt that there were especially great obstacles or that things were especially difficult. From the Dharma perspective, whether anything succeeds or fails follows causes and conditions. Whether in personal cultivation or in propagating the Dharma and benefiting sentient beings, all we can do is establish the right conditions while also accepting every result. Cultivation is not easy to begin with, and helping the masses move from delusion to awakening involves many conditions, so it is even harder; it is normal even when things do not go well.

有了这样的定位，努力做就是了。一直以来，我们做的就是不断改善因缘，包括整体定位和各项工作的深入细化。在此过程中，看到自己一点一滴的进步，看到很多人在三级修学中的成长，都是很欢喜的事，所以不会做不动。

With this understanding, just keep doing your best. All along, what we have done is continually improve the conditions, including our overall orientation and deepening and refining each task. In this process, we take great joy in seeing our own gradual progress and the growth of many people in the Three-Stage Practice, so we never feel unable to continue.

== 十五、三级修学 / XV. Three-Stage Practice <ch15>

=== 三级修学是共同创作 / Three-Stage Practice Is a Co-creation <ch15-q01>

_问：_ 法师怎么想到要建立三级修学体系？这对学佛有什么帮助？

_Q:_ How did the Venerable come to establish the Three-Stage Practice system? What help does it offer for learning Buddhism?

_答：_ 这和我长期以来的弘法思路有关。我从上世纪九十年代开始弘法，立足于人生佛教，希望以此解决现实问题，比如佛法怎么看财富、看环保、看幸福等。人生佛教系列丛书就代表我长期以来的思考。因为佛法确实能解决社会人生的问题，所以我才不遗余力地传播。

_A:_ This is connected with my long-standing approach to propagating the Dharma. I began propagating the Dharma in the 1990s, grounded in Humanistic Buddhism, hoping through it to address real-life issues such as how the Dharma views wealth, environmental protection, and happiness. The Humanistic Buddhism book series represents my long-standing reflections. Because the Dharma truly can solve problems in society and human life, I have spared no effort in propagating it.

但佛法浩如烟海，每个法门都有不同的经典和修行方法，究竟怎么学？关键在于目标明确、方法正确。首先是目标明确，清楚初级、中级、高级分别学什么，学到什么程度，设立量化指标，而不是笼统或零碎地学点什么。其次是方法正确，从缘起法来说，任何结果都来自因，只要找到正确的因，在因上努力，结果是水到渠成的。此外，有效引导和良好氛围也是不可或缺的。基于这些因素，我们逐步形成了三级修学体系。

But the Dharma is as vast as the ocean; every approach has its own scriptures and methods of practice. How, then, should we study it? The key is clear goals and correct methods. First, goals must be clear: knowing what to study at the elementary, intermediate, and advanced levels, how far to take each, and setting measurable standards rather than studying something vague or piecemeal. Second, methods must be correct: in terms of dependent origination, every result arises from its causes; once we find the right causes and work at that level, the result will follow naturally. In addition, effective guidance and a supportive atmosphere are indispensable. Based on these factors, we gradually developed the Three-Stage Practice system.

做的过程就像创作，不是我一个人在探索，而是所有义工和学员在共同创作。我们的产品既是这个平台，也是其中的每个学员。从某种意义上说，人就是一个产品。不同的观念、言行、心态，最终会造就不同的生命品质。现在整个社会强调发展，但更多是追求物质的发展。其实对每个人来说，更重要的是发展什么样的生命品质，这才是人生最重大的事。三级修学正是立足于这个核心，让大家通过修学共同成长。

The process of building it has been like creative work—not my own solitary exploration, but a co-creation by all the volunteers and students. Our product is both this platform and every student within it. In a sense, a person _is_ a product. Different ideas, words, actions, and mental states ultimately produce different qualities of life. Today society emphasizes development, but mostly it pursues material development. For each individual, what matters more is what kind of life quality we develop; this is the most important thing in life. Three-Stage Practice is founded on this core, enabling everyone to grow together through study and practice.

=== 任何法门都离不开基础 / No Approach Can Do Without the Foundation <ch15-q02>

_问：_ 三级修学的特色是什么？我是学净土法门的，如果参加三级修学，如何处理好两者的关系？

_Q:_ What are the special features of Three-Stage Practice? I practice the Pure Land method; if I join Three-Stage Practice, how should I balance the two?

_答：_ 学佛是从迷惑走向觉醒，这个过程要有次第、有方法、有氛围。我们有一套八步骤三种禅修的方法，按照这些步骤，可以在深入理解法义的基础上，将此转化成自身观念，从而摆脱不良心态，重复和强化正向心态，最终把佛法智慧变成自己的生命品质。只要用心去做，贪嗔痴就会日渐减少，正念、观照力、慈悲心也会随之强大。这个过程不仅要下功夫，还要真诚、认真、老实。否则法是法，我是我，学得再多也难有真实受用。

_A:_ Learning Buddhism is a journey from confusion to awakening; this process needs stages, methods, and atmosphere. We have a method called Eight Steps and Three Kinds of Meditation. Following these steps, we can deeply understand the Dharma and transform it into our own outlook, thereby freeing ourselves from unwholesome mental states and repeatedly strengthening wholesome ones, until the wisdom of the Dharma becomes the quality of our own lives. If we apply ourselves, greed, hatred, and delusion will gradually diminish, while mindfulness, reflective awareness, and compassion will grow stronger. This process requires not only effort but also sincerity, earnestness, and honesty. Otherwise the Dharma remains the Dharma and I remain myself; no matter how much we study, it is hard to receive real benefit.

净土法门很殊胜，但要把阿弥陀佛念得有力量，其实并不容易。首先要有愿离娑婆的出离心和利益众生的菩提心；其次要具足正见，认识到人生如幻、轮回是苦，还要认识到阿弥陀佛具备的无量功德。在此基础上念佛，才能念得有力。不少人虽然在念佛，却有口无心，对极乐世界的信愿行不足，更多时间还是在尘劳妄想中，怎么可能修得好？

The Pure Land method is excellent, but to recite Amitabha Buddha's name with real power is not easy. First we need the renunciation that wishes to leave the Saha world and the bodhicitta that seeks to benefit sentient beings; second, we need right view—recognizing that human life is like an illusion, that samsara is suffering, and that Amitabha Buddha possesses immeasurable merit. Only on this basis can Buddha-recitation become forceful. Many people recite the Buddha's name with their mouths but not their hearts; their faith, aspiration, and practice toward the Pure Land are insufficient, and most of their time is still spent in worldly toil and delusive thinking—how could they practice well?

通过三级修学，可以把握佛法纲要，对三宝具足信心，发起真切的出离心和菩提心，这些对修习净土很有帮助。至于处理关系，其实两者并不矛盾，主要是时间安排。从眼前看，参加修学需要投入时间，似乎念佛时间会减少。其实磨刀不误砍柴工，有了心行基础以后再来念佛，就能事半功倍。

Through Three-Stage Practice we can grasp the outline of the Dharma, gain full confidence in the Three Jewels, and arouse genuine renunciation and bodhicitta; all of this is very helpful for Pure Land practice. As for balancing the two, they are not really in conflict; it is mainly a matter of scheduling. In the short term, participating in study and practice takes time, so it may seem that Buddha-recitation time is reduced. But sharpening the axe does not delay the cutting of firewood: once we have a foundation in mind and conduct, Buddha-recitation will yield twice the result with half the effort.

=== 修行要抓住重点 / Grasp the Essentials in Practice <ch15-q03>

_问：_ 法师提出了修学五大要素和三级修学次第，这个体系的终极关怀是什么？最后把我们引到哪儿？

_Q:_ The Venerable has put forward the five essential elements of practice and the Three-Stage Practice sequence. What is the ultimate concern of this system? Where does it lead us in the end?

_答：_ 现代社会资讯发达，这本是学佛的方便，但选择太多又缺乏判断力时，反而会造成困扰。当我们面对的不是一宗一派，而是南传、汉传、藏传三大语系的无量法门，以及种种不同的见地和修法，就会觉得彼此矛盾，不知如何抉择；或是觉得都有道理，抓不住要领。事实上，这都是修学的障碍。

_A:_ Modern society has abundant information, which could be an advantage for learning Buddhism, yet when there are too many choices and too little discernment, it becomes a source of confusion. When we face not just one school but the limitless methods of the three great traditions—Theravada, Chinese Buddhism, and Tibetan Buddhism—along with their various views and practices, we may feel they contradict one another and not know how to choose; or we may feel they all make sense yet be unable to grasp the essentials. In fact, all of this is an obstacle to study and practice.

如何快速把握佛法纲要？我在修学中发现，千经万论都是指向两条道路，一是解脱道，一是菩萨道。两者从起点、修法到目标都有明确指向。解脱道是以出离心为基础，引导我们成就解脱。菩萨道是以菩提心为基础，不仅自己解脱，还要带领众生走向解脱。不论走哪条路，不外乎皈依、发心、戒律、正见、止观五大要素。立足这些核心，就知道每个阶段要掌握什么，达到什么目标。

How can we quickly grasp the outline of the Dharma? In my own study I have found that the thousands of scriptures and treatises all point to two paths: the path of liberation and the bodhisattva path. Both have clear directions in terms of starting point, method, and goal. The path of liberation is founded on renunciation and guides us to attain liberation. The bodhisattva path is founded on bodhicitta: not only liberating oneself but also leading sentient beings to liberation. Whichever path we take, it consists of no more than the five essential elements—refuge, aspiration, precepts, right view, and śamatha-vipaśyanā. Standing on these essentials, we know what to master at each stage and what goal to reach.

至于这条路把大家带到哪里，其实就是回归佛陀出世的本怀。本次静修营的主题讲座，是从四谛法门认识佛法的修行纲领。佛陀要把众生带到哪里？就是把众生带上解脱之路，觉醒之路。我们学佛，正是沿着佛陀指引的路线前行。

As for where this path leads everyone, it is actually a return to the Buddha's original purpose in appearing in the world. The theme lectures of this retreat present the framework of Buddhist practice through the Four Noble Truths. Where did the Buddha wish to lead sentient beings? He wished to lead them onto the path of liberation, the path of awakening. Our study of Buddhism is precisely a journey along the route the Buddha pointed out.

== 十六、总结开示 / XVI. Concluding Dharma Words <ch16>

静修营从早到晚都有活动，安排得很紧张。大家从原来懈怠放逸的凡夫心状态，进入有规律的修行生活，可能挺辛苦的。但看起来每个人都法喜充满，想必已经得到法的滋润。即使这样，也不可能在短短几天内解决所有问题，关键是未来继续修学。否则，即使解决了几个问题，依然会有无量问题。因为现代人解决问题的能力强，制造问题的能力更强。如果不从根本解决，问题将层出不穷，包括人生的问题，也包括修学的问题。

The retreat schedule is packed from morning till night. Moving from a state of ordinary, lax, and indulgent mind into a regulated life of practice can be quite demanding. Yet everyone seems joyful, which shows that the Dharma has already nourished you. Even so, it is impossible to resolve every problem within just a few days. The key is to continue practicing afterward. Otherwise, even if a few problems are solved, countless more will remain. Modern people are skilled at solving problems, but even more skilled at creating them. Without addressing the root, problems will keep arising—problems in life as well as problems in practice.

学佛并不是向外求，重心在于每个人自己。寺院的存在价值，也是帮助大家找回自己。我们今天坐在这里，是多生累劫的福德因缘。更重要的，是继续把佛法落实到生活乃至生命中。大家在这里有良好的感受，离不开寺院的清净环境和法师们的悉心引导。回到社会后，内在躁动加上外在干扰，修学会特别困难。很可能，这几天的美好生活就成为一去不复返的回忆。最好的办法是加入三级修学，这里不仅有引导，有次第，还有一群伙伴共同营造的氛围，是我们在菩提路上稳步前行的保障。

Learning Buddhism isn't about looking outside ourselves; it comes down to each one of us. The temple is also valuable because it helps us find our way back to ourselves. Our gathering here today is the result of merit and conditions accumulated over many lives. More importantly, we should keep bringing the Dharma into our daily lives until it becomes part of who we are. The positive experience we have had here is inseparable from the pure environment of the temple and the careful guidance of the teachers. Once we return to society, inner restlessness combined with outer distractions will make practice especially difficult. These beautiful days may easily become nothing more than fond memories. The best way forward is to join the Three-Stage Practice program, where we will find guidance, a structured path, and a supportive community—an environment that steadies us as we walk the bodhi path.
