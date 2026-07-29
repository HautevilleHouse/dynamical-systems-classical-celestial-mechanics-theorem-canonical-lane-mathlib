import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure EulerLagrangePackage where
  position : Type u
  velocity : Type v
  time : Type w
  lagrangian : position -> velocity -> time -> Type x
  eulerLagrangeEquation : Prop
  stationaryAction : Prop

structure EulerLagrangeEvidence (E : EulerLagrangePackage) where
  eulerLagrangeEquationClosed : E.eulerLagrangeEquation
  stationaryActionClosed : E.stationaryAction

def EulerLagrangeClosed (E : EulerLagrangePackage) : Prop :=
  E.eulerLagrangeEquation ∧ E.stationaryAction

theorem euler_lagrange_closed_from_evidence (E : EulerLagrangePackage) (Ev : EulerLagrangeEvidence E) : EulerLagrangeClosed E :=
  And.intro Ev.eulerLagrangeEquationClosed Ev.stationaryActionClosed

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse