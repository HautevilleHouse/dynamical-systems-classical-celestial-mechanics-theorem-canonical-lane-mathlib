import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure NBodyGravitationalPotential (n : Nat) where
  masses : Array (Type u)
  positions : Array (Type v)
  potentialFunction : Type w
  inverseSquareLaw : Prop
  smoothExceptCollisions : Prop

structure NBodyPotentialEvidence {n : Nat} (P : NBodyGravitationalPotential n) where
  inverseSquareLawClosed : P.inverseSquareLaw
  smoothExceptCollisionsClosed : P.smoothExceptCollisions

def NBodyPotentialClosed {n : Nat} (P : NBodyGravitationalPotential n) : Prop :=
  P.inverseSquareLaw ∧ P.smoothExceptCollisions

theorem nbody_potential_closed_from_evidence {n : Nat} (P : NBodyGravitationalPotential n) (Ev : NBodyPotentialEvidence P) : NBodyPotentialClosed P :=
  And.intro Ev.inverseSquareLawClosed Ev.smoothExceptCollisionsClosed

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse