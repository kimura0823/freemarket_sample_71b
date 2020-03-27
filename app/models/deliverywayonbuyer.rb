class Deliverywayonbuyer < ActiveHash::Base
  self.data = [
      {id: 11, way: '選択してください'}, 
      {id: 12, way: '未定'}, 
      {id: 13, way: 'クロネコヤマト'}, 
      {id: 14, way: 'ゆうパック'}, 
      {id: 15, way: 'ゆうメール'}, 
  ]
end