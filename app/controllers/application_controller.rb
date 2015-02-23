class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  before_filter :initialize_users_for_header

abbreviations = {'Athenian' => 'ATHEN', 'Ca Schl Deaf' => 'CASDEAF', 'John Swett' => 'J SWETT', 'Lick-Wilmerding' => 'LICKWIL', 'Liv Vly Charter' => 'LIVVYCH', 'St. Pat - St. Vin' => 'ST PAT', 'Stuart Hall' => 'STUHAL', 'Antioch' => 'ANTIOCH', 'Deer Valley' => 'DEERVLY', 'Freedom' => 'FREEDOM', 'Heritage' => 'HERITAG', 'Liberty' => 'LIBERTY', 'Pittsburg' => 'PITT', 'Archbishop Hanna' => 'A B HAN', 'Clear Lake' => 'CLR LK', 'Fort Bragg' => 'FT BRAG', 'Kelseyville' => 'KELSEY', 'Lower Lake' => 'LOWR LK', 'Middletown' => 'MIDDLE', 'Point Arena' => 'PT AREN', 'St. Helena' => 'ST HELEN', 'Technology' => 'TECH', 'Upper Lake' => 'UPP LK', 'Willits' => 'WILLITS', 'Acalanes' => 'ACALAN', 'Alhambra' => 'ALHAM', 'Campolindo' => 'CAMPO', 'Dougherty Valley' => 'DRTYVAL', 'Dublin' => 'DUBLIN', 'Las Lomas' => 'LAS LOM', 'Miramonte' => 'MIRAMNT', 'Berean Christian' => 'BER CHR', 'Clayton Valley' => 'CLA VLY', 'College Park' => 'COL PRK', 'Concord' => 'CONCRD', 'Mt. Diablo' => 'MT DIAB', 'Northgate' => 'NORGAT', 'Ygnacio Valley' => 'YGN VLY', 'Amador Valley' => 'AMADOR', 'California' => 'CALIF', 'De La Salle' => 'DELAS', 'Foothill' => 'FOOTHL', 'Granada' => 'GRANADA', 'Livermore' => 'LIVERMR', 'Monte Vista' => 'MNTVSTA', 'San Ramon' => 'SN RAM', 'Arcata' => 'ARCATA', 'Del Norte' => 'DEL NOR', 'Eureka' => 'EUREKA', 'Fortuna' => 'FORTUNA', 'Hoopa' => 'HOOPA', 'McKinleyville' => 'MCKINLY', 'South Fork' => 'SO FORK', 'Justin Sienna' => 'J SIENA', 'Marin Catholic' => 'MAR CATH', 'Novato' => 'NOVATO', 'Redwood' => 'REDWD', 'San Marin' => 'SN MARIN', 'San Rafael' => 'SN RAFL', 'Sir Francis Drake' => 'SF DRAKE', 'Tamalpais' => 'TAMAL', 'Terra Linda' => 'TER LIN', 'American' => 'AMER', 'Irvington' => 'IRVING', 'J F Kennedy' => 'J F KEN', 'James Logan' => 'J LOGAN', 'Mission San Jose' => 'MISSION', 'Newark Memorial' => 'NWK MEM', 'Washington' => 'WASH', 'Cardinal Newman' => 'CDNEWM', 'Casa Grande' => 'CASAGR', 'Maria Carrillo' => 'MAR CAR', 'Montgoery' => 'MONTG', 'Rancho Cotate' => 'RANCHO', 'Santa Rosa' => 'SN ROSA', 'Ukiah' => 'UKIAH', 'Windsor' => 'WINDSR', 'Analy' => 'ANALY', 'El Molino' => 'EL MOL', 'Elsie Allen' => 'ELS ALLN', 'Healdsburg' => 'HEALDS', 'Petaluma' => 'PETAL', 'Piner' => 'PINER', 'Sonoma Valley' => 'SONOMA', 'Albany' => 'ALBANY', 'Arroyo' => 'ARROYO', 'Berkeley' => 'BERK', 'Castro Valley' => 'CAS VLY', 'Hayward' => 'HAYWRD', 'Mt. Eden' => 'MT EDEN', 'San Leandro' => 'SN LEAN', 'San Lorenzo' => 'SN LOR'}

  def configure_devise_permitted_parameters
    registration_params = [:email, :name, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  def initialize_users_for_header
    @users = User.order('league ASC')
    @wrestlers = Wrestler.order('weight ASC')

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  def require_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_url, alert: "You do not have permission!"
    end
  end
end
