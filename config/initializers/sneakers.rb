require 'sneakers'

Sneakers.configure(
  connection: Bunny.new(
    hostname: 'insura_rabbit'
  ),
  heartbeat: 30,
  exchange: 'sneakers',
  exchange_type: 'direct'
)
