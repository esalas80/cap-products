using {com.erva as erva} from '../db/schema';

service CustomerService {
    entity CustomerSrv as projection on erva.Customer;
}
