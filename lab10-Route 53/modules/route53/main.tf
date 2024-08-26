provider "aws" {
  region = var.region
}

resource "aws_route53_resolver_endpoint" "R53_OutboundEndpoint" {
  name      = "R53_OutboundEndpoint"
  direction = "OUTBOUND"
  resolver_endpoint_type = "IPV4"
  
  security_group_ids = [
    var.security_group_for_directory
  ]

  ip_address {
    subnet_id = var.private_subnet_ips[0]
  }

  ip_address {
    subnet_id = var.private_subnet_ips[1]
  }

  protocols = ["Do53"]

  tags = {
    Name = "R53_OutboundEndpoint"
  }

}

resource "aws_route53_resolver_endpoint" "R53_InboundEndpoint" {
  name      = "R53_InboundEndpoint"
  direction = "INBOUND"
  resolver_endpoint_type = "IPV4"
  
  security_group_ids = [
    var.security_group_for_directory
  ]

  ip_address {
    subnet_id = var.private_subnet_ips[0]
  }

  ip_address {
    subnet_id = var.private_subnet_ips[1]
  }

  protocols = ["Do53"]

  tags = {
    Name = "R53_InboundEndpoint"
  }

}

resource "aws_route53_resolver_rule" "fwd_to_onprem_AD" {
  domain_name          = "onprem.example.com"
  name                 = "ForwardToOnPremAD"
  rule_type            = "FORWARD"
  resolver_endpoint_id = aws_route53_resolver_endpoint.R53_OutboundEndpoint.id
  

  target_ip {
    ip = var.ip_dns_onprem[0]
  }

  target_ip {
    ip = var.ip_dns_onprem[1]
  }

  tags = {
    Name = "fwd_to_onprem_AD"
  }
}

resource "aws_route53_resolver_rule_association" "fwd_to_onprem_AD_association" {
  resolver_rule_id = aws_route53_resolver_rule.fwd_to_onprem_AD.id
  vpc_id     = var.vpc_id
}