const initialState = {
      name:"" ,
      url_name: "",
      number: 0,
      introduction: "",
      image: "",
      bill_image:'',
      delegete_name:  "",
      delegete_contact: "",
      campus:"" ,
      entrance_fee:'',
      annual_fee: '',
      activity_week:"",
      activity_time:"",
      admission_deadline:"",
      box_number:0,
      booth_number:0
  }

const adminSetState = (state=initialState,action) => {

  switch(action.type){

    case 'ADMIN_SET_NAME':
      return Object.assign({},state,{
          name: action.name}
          )
    case 'ADMIN_SET_URL':
      return Object.assign({}, state, {
        url_name: action.url
        })
    case 'ADMIN_SET_NUMBER':
      return Object.assign({}, state, {
        number: Number(action.number)
        })
    case 'ADMIN_SET_INTRO':
      return Object.assign({}, state, {
        introduction: action.intro
      })
    case 'ADMIN_SET_DELENAME':
      return Object.assign({}, state, {
        delegete_name: action.name
      })
    case 'ADMIN_SET_CONTACT':
      return Object.assign({}, state, {
        delegete_contact: action.contact
      })
    case 'ADMIN_SET_CAMPUS':
      return Object.assign({}, state, {
        campus: action.campus
      })
    case 'ADMIN_SET_ENTRANCE':
      return Object.assign({}, state, {
        entrance: action.entrance
      })
    case 'ADMIN_SET_ANNUAL':
      return Object.assign({}, state, {
        annual: action.annual
      })
    case 'ADMIN_SET_WEEK':
      return Object.assign({}, state, {
        week: action.week
      })
    case 'ADMIN_SET_TIME':
      return Object.assign({}, state, {
        time: action.time
      })
    case 'ADMIN_SET_ADMISSION':
      return Object.assign({}, state, {
        admission: action.admission
      })
    case 'ADMIN_SET_BOX':
      return Object.assign({}, state, {
        box: action.box
      })
    case 'ADMIN_SET_BOOTH':
      return Object.assign({}, state, {
        booth:action.booths
      })
    default:
      return(
        state
      )

  }
};

export default adminSetState
