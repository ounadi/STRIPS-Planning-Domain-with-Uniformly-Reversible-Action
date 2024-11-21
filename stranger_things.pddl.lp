%---------------------------------------
% domain
%---------------------------------------

% utils
boolean(true).
boolean(false).

% types
type(type("object")).

% variables
variable(variable("demogorgon_at_hawkings")).
variable(variable("elevensquad_takedown_monster")).
variable(variable("elevensquad_at_hawkings")).
variable(variable("monster_at_hawkings")).
variable(variable("elevensquad_at_upside_down")).
variable(variable("monster_attacked")).
variable(variable("elevensquad_relaxed")).
variable(variable("elevensquad_sos")).
variable(variable("elevensquad_synergy")).

contains(X, value(X, B)) :- variable(X), boolean(B).

% actions
action(action("go_to_byers")).
postcondition(action("go_to_byers"), effect(unconditional), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("go_to_byers")).

action(action("bring_monster")).
postcondition(action("bring_monster"), effect(unconditional), variable("monster_at_hawkings"), value(variable("monster_at_hawkings"), true)) :- action(action("bring_monster")).

action(action("go_to_hawkings")).
precondition(action("go_to_hawkings"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("go_to_hawkings")).
postcondition(action("go_to_hawkings"), effect(unconditional), variable("monster_at_hawkings"), value(variable("monster_at_hawkings"), true)) :- action(action("go_to_hawkings")).
postcondition(action("go_to_hawkings"), effect(unconditional), variable("elevensquad_at_upside_down"), value(variable("elevensquad_at_upside_down"), false)) :- action(action("go_to_hawkings")).

action(action("hunt_monster")).
precondition(action("hunt_monster"), variable("elevensquad_at_hawkings"), value(variable("elevensquad_at_hawkings"), true)) :- action(action("hunt_monster")).
precondition(action("hunt_monster"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("hunt_monster")).
precondition(action("hunt_monster"), variable("monster_at_hawkings"), value(variable("monster_at_hawkings"), true)) :- action(action("hunt_monster")).
postcondition(action("hunt_monster"), effect(unconditional), variable("elevensquad_takedown_monster"), value(variable("elevensquad_takedown_monster"), true)) :- action(action("hunt_monster")).

action(action("go_to_upside_down")).
precondition(action("go_to_upside_down"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("go_to_upside_down")).
precondition(action("go_to_upside_down"), variable("monster_at_hawkings"), value(variable("monster_at_hawkings"), true)) :- action(action("go_to_upside_down")).
precondition(action("go_to_upside_down"), variable("elevensquad_takedown_monster"), value(variable("elevensquad_takedown_monster"), true)) :- action(action("go_to_upside_down")).
postcondition(action("go_to_upside_down"), effect(unconditional), variable("monster_at_hawkings"), value(variable("monster_at_hawkings"), false)) :- action(action("go_to_upside_down")).
postcondition(action("go_to_upside_down"), effect(unconditional), variable("elevensquad_at_upside_down"), value(variable("elevensquad_at_upside_down"), true)) :- action(action("go_to_upside_down")).
postcondition(action("go_to_upside_down"), effect(unconditional), variable("elevensquad_at_hawkings"), value(variable("elevensquad_at_hawkings"), false)) :- action(action("go_to_upside_down")).

action(action("unleash_monster")).
precondition(action("unleash_monster"), variable("monster_at_hawkings"), value(variable("monster_at_hawkings"), false)) :- action(action("unleash_monster")).
precondition(action("unleash_monster"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("unleash_monster")).
precondition(action("unleash_monster"), variable("elevensquad_takedown_monster"), value(variable("elevensquad_takedown_monster"), true)) :- action(action("unleash_monster")).
precondition(action("unleash_monster"), variable("elevensquad_at_upside_down"), value(variable("elevensquad_at_upside_down"), true)) :- action(action("unleash_monster")).
precondition(action("unleash_monster"), variable("elevensquad_at_hawkings"), value(variable("elevensquad_at_hawkings"), false)) :- action(action("unleash_monster")).
postcondition(action("unleash_monster"), effect(unconditional), variable("elevensquad_takedown_monster"), value(variable("elevensquad_takedown_monster"), false)) :- action(action("unleash_monster")).
postcondition(action("unleash_monster"), effect(unconditional), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), false)) :- action(action("unleash_monster")).

action(action("dodge_monster")).
precondition(action("dodge_monster"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("dodge_monster")).
postcondition(action("dodge_monster"), effect(unconditional), variable("monster_attacked"), value(variable("monster_attacked"), false)) :- action(action("dodge_monster")).

action(action("attack_monster")).
precondition(action("attack_monster"), variable("monster_attacked"), value(variable("monster_attacked"), false)) :- action(action("attack_monster")).
precondition(action("attack_monster"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("attack_monster")).
postcondition(action("attack_monster"), effect(unconditional), variable("monster_attacked"), value(variable("monster_attacked"), true)) :- action(action("attack_monster")).
postcondition(action("attack_monster"), effect(unconditional), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), false)) :- action(action("attack_monster")).

action(action("bring_demogorgon")).
postcondition(action("bring_demogorgon"), effect(unconditional), variable("demogorgon_at_hawkings"), value(variable("demogorgon_at_hawkings"), true)) :- action(action("bring_demogorgon")).
postcondition(action("bring_demogorgon"), effect(unconditional), variable("elevensquad_synergy"), value(variable("elevensquad_synergy"), false)) :- action(action("bring_demogorgon")).

action(action("call_another_elevensquad")).
precondition(action("call_another_elevensquad"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("call_another_elevensquad")).
precondition(action("call_another_elevensquad"), variable("demogorgon_at_hawkings"), value(variable("demogorgon_at_hawkings"), true)) :- action(action("call_another_elevensquad")).
precondition(action("call_another_elevensquad"), variable("elevensquad_synergy"), value(variable("elevensquad_synergy"), false)) :- action(action("call_another_elevensquad")).
postcondition(action("call_another_elevensquad"), effect(unconditional), variable("elevensquad_sos"), value(variable("elevensquad_sos"), true)) :- action(action("call_another_elevensquad")).

action(action("elevensquad_harmony")).
precondition(action("elevensquad_harmony"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("elevensquad_harmony")).
precondition(action("elevensquad_harmony"), variable("demogorgon_at_hawkings"), value(variable("demogorgon_at_hawkings"), true)) :- action(action("elevensquad_harmony")).
precondition(action("elevensquad_harmony"), variable("elevensquad_sos"), value(variable("elevensquad_sos"), true)) :- action(action("elevensquad_harmony")).
postcondition(action("elevensquad_harmony"), effect(unconditional), variable("elevensquad_synergy"), value(variable("elevensquad_synergy"), true)) :- action(action("elevensquad_harmony")).
postcondition(action("elevensquad_harmony"), effect(unconditional), variable("elevensquad_sos"), value(variable("elevensquad_sos"), false)) :- action(action("elevensquad_harmony")).

action(action("take_demogorgon_to_upside_down")).
precondition(action("take_demogorgon_to_upside_down"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("take_demogorgon_to_upside_down")).
precondition(action("take_demogorgon_to_upside_down"), variable("elevensquad_synergy"), value(variable("elevensquad_synergy"), true)) :- action(action("take_demogorgon_to_upside_down")).
precondition(action("take_demogorgon_to_upside_down"), variable("demogorgon_at_hawkings"), value(variable("demogorgon_at_hawkings"), true)) :- action(action("take_demogorgon_to_upside_down")).
postcondition(action("take_demogorgon_to_upside_down"), effect(unconditional), variable("demogorgon_at_hawkings"), value(variable("demogorgon_at_hawkings"), false)) :- action(action("take_demogorgon_to_upside_down")).

action(action("elevensquad_dismantle")).
precondition(action("elevensquad_dismantle"), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), true)) :- action(action("elevensquad_dismantle")).
precondition(action("elevensquad_dismantle"), variable("demogorgon_at_hawkings"), value(variable("demogorgon_at_hawkings"), false)) :- action(action("elevensquad_dismantle")).
precondition(action("elevensquad_dismantle"), variable("elevensquad_synergy"), value(variable("elevensquad_synergy"), true)) :- action(action("elevensquad_dismantle")).
precondition(action("elevensquad_dismantle"), variable("elevensquad_sos"), value(variable("elevensquad_sos"), false)) :- action(action("elevensquad_dismantle")).
postcondition(action("elevensquad_dismantle"), effect(unconditional), variable("elevensquad_synergy"), value(variable("elevensquad_synergy"), false)) :- action(action("elevensquad_dismantle")).
postcondition(action("elevensquad_dismantle"), effect(unconditional), variable("elevensquad_relaxed"), value(variable("elevensquad_relaxed"), false)) :- action(action("elevensquad_dismantle")).
