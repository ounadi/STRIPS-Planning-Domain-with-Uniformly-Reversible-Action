(define (domain strangerthings)
    
    (:requirements :strips)

    
    (:predicates
        (demogorgon_at_hawkings)
        (elevensquad_takedown_monster) ;the elevensquad had the box
        (elevensquad_at_hawkings) ; the elevensquad is in Hawkings
        (monster_at_hawkings) ; the demogorgon is at Hawkings
        (elevensquad_at_upside_down) ;the elevensquad is at the upsidetown
        (monster_attacked) ; the monster is attacked
        (elevensquad_relaxed) ; the elevenquad is relaxed and ready to battle
        (elevensquad_sos) ; an elevensquad calls for help from an allie
        (elevensquad_synergy) ; two elevensquads cooperate
    )    


    ; Go to Byers
    (:action go_to_byers
        :effect (and 
            (elevensquad_relaxed)
        )
    )
    ; Bring a monster to Hawkings
    (:action bring_monster
        :effect (and 
            (monster_at_hawkings)
        )
    ) 
    
    ;Go the monster location
    (:action go_to_hawkings
        :precondition (and 
            (elevensquad_relaxed)
        )
        :effect (and 
            (monster_at_hawkings)
            (not(elevensquad_at_upside_down))
        )
    )

    ;hunt the monster 

    (:action hunt_monster
        :precondition (and
            (elevensquad_at_hawkings)
            (elevensquad_relaxed)
            (monster_at_hawkings)
        )
        :effect (and 
            (elevensquad_takedown_monster)
        )
    )

    ;Go to the upside down

    (:action go_to_upside_down
        :precondition (and 
            (elevensquad_relaxed)
            (monster_at_hawkings)
            (elevensquad_takedown_monster)
        )
        :effect (and 
            (not (monster_at_hawkings))
            (elevensquad_at_upside_down)
            (not (elevensquad_at_hawkings))
        )
    )

    ;unleash the monster

    (:action unleash_monster
        :precondition (and 
            (not(monster_at_hawkings))
            (elevensquad_relaxed)
            (elevensquad_takedown_monster)
            (elevensquad_at_upside_down)
            (not(elevensquad_at_hawkings))
        )
        :effect (and 
            (not(elevensquad_takedown_monster))
            (not (elevensquad_relaxed))
        )
    )
    
    ; dodging monster
    (:action dodge_monster
        :precondition (and 
            (elevensquad_relaxed)
        
        )
        :effect (and 
            (not (monster_attacked))
        )
    )

    ; attack monster
    (:action attack_monster
        :precondition (and
            (not(monster_attacked)) 
            (elevensquad_relaxed)
        )
        :effect (and
            (monster_attacked)
            (not (elevensquad_relaxed))
        )
    )

    ;bring demogorgon 
    (:action bring_demogorgon
        :effect (and 
            (demogorgon_at_hawkings)
            (not(elevensquad_synergy))
        )
    )
    
    ;combine the power of two members in the elevensquad 
    (:action call_another_elevensquad
        :precondition (and
            (elevensquad_relaxed)
            (demogorgon_at_hawkings)
            (not(elevensquad_synergy))
        )
        :effect (and 
            (elevensquad_sos)
        )
    )

    ;perform the cooperation between 2 elevensquads
    (:action elevensquad_harmony
        :precondition (and
            (elevensquad_relaxed)
            (demogorgon_at_hawkings)
            (elevensquad_sos)
        )
        :effect (and
            (elevensquad_synergy)
            (not(elevensquad_sos))
        )
    )
    
    ;take demogorgon to upside down 
    (:action take_demogorgon_to_upside_down
        :precondition (and 
            (elevensquad_relaxed)
            (elevensquad_synergy)
            (demogorgon_at_hawkings)
        )
        :effect (and 
            (not(demogorgon_at_hawkings))
        )
    )

    ; the goodbye between two elevensquad members

    (:action elevensquad_dismantle
        :precondition (and 
            (elevensquad_relaxed)
            (not(demogorgon_at_hawkings))
            (elevensquad_synergy)
            (not(elevensquad_sos))
        )
        :effect (and 
            (not(elevensquad_synergy))
            (not(elevensquad_relaxed))
        )
    )

)
