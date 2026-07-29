import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure KeplerPackage (n : Nat) where
  centralMass : Type u
  satelliteMass : Type v
  angularMomentumConservation : Prop
  eccentricityVector : Type w
  orbitConicSection : Prop
  periodSemiMajorLaw : Prop

structure KeplerEvidence {n : Nat} (K : KeplerPackage n) where
  angularMomentumConservationClosed : K.angularMomentumConservation
  orbitConicSectionClosed : K.orbitConicSection
  periodSemiMajorLawClosed : K.periodSemiMajorLaw

def KeplerClosed {n : Nat} (K : KeplerPackage n) : Prop :=
  K.angularMomentumConservation ∧ K.orbitConicSection ∧ K.periodSemiMajorLaw

theorem kepler_closed_from_evidence {n : Nat} (K : KeplerPackage n) (Ev : KeplerEvidence K) : KeplerClosed K :=
  And.intro Ev.angularMomentumConservationClosed (And.intro Ev.orbitConicSectionClosed Ev.periodSemiMajorLawClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse