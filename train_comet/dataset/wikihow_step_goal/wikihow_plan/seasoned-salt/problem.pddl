(define (problem make-seasoned-salt)
  (:domain seasoned-salt)
  (:objects 
    celery_salt - entity
    air_tight_container - container
    salads - food
    mortar_and_pestle - tool
    mixing_bowl - container
  )
  (:init 
    (stratified celery_salt)
    (separate celery_salt)
    (empty air_tight_container)
    (plain salads)
    (absent mortar_and_pestle)
    (empty mixing_bowl)
  )
  (:goal 
    (and 
      (flavorful salads)
      (present mortar_and_pestle)
      (not (stratified celery_salt))
      (not (separate celery_salt))
      (empty air_tight_container)
    )
  )
)