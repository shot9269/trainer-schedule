document.addEventListener("DOMContentLoaded",function(){
  const add = document.getElementById("add_subject")
  add.addEventListener("click",()=>{
    const workoutForm = document.getElementById("workoutForm")
    const workout = document.getElementById("workout")
    const form = `<ul class="plan_detail_subject" ,="" id="workout">
    <li>
      <label for="plan_detail_subject">種目:</label>
      <input type="text" name="plan_detail[subject]" id="plan_detail_subject">
    </li>
    <li>
      <label for="plan_detail_weight">/重量:</label>
      <input class="weight" type="number" name="plan_detail[weight]" id="plan_detail_weight"><span>kg/</span>
    </li>
    <li>
      <label for="plan_detail_set">セット数:</label>
      <input class="subject_set_rep" type="number" name="plan_detail[set]" id="plan_detail_set"><span>セット/</span>
    </li>
    <li>
    <label for="plan_detail_rep">回数:</label>
    <input class="subject_set_rep" type="number" name="plan_detail[rep]" id="plan_detail_rep"><span>回</span>
    </li>
</ul>`
    workout.insertAdjacentHTML("afterend",form)
  })

})
