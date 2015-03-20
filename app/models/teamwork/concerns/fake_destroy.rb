module Teamwork
  module Concerns
    module FakeDestroy
      def destroy
        self.update(active: false)
      end
    end
  end
end
